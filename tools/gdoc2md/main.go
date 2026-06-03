package main

import (
	"bytes"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"
	"time"
)

type apiError struct {
	Error struct {
		Code    int    `json:"code"`
		Message string `json:"message"`
		Status  string `json:"status"`
	} `json:"error"`
}

func main() {
	if err := run(os.Args[1:]); err != nil {
		fmt.Fprintf(os.Stderr, "gdoc2md: %v\n", err)
		os.Exit(1)
	}
}

func run(args []string) error {
	outDir := defaultOutDir()
	var fileName string
	var userProject string
	var stripImages bool

	flags := flag.NewFlagSet("gdoc2md", flag.ContinueOnError)
	flags.SetOutput(os.Stderr)
	flags.StringVar(&outDir, "out-dir", outDir, "directory to write the markdown file")
	flags.StringVar(&outDir, "o", outDir, "directory to write the markdown file")
	flags.StringVar(&fileName, "file", "", "output filename, relative to --out-dir")
	flags.StringVar(&userProject, "user-project", os.Getenv("GDOC2MD_USER_PROJECT"), "optional Google Cloud quota/billing project")
	flags.BoolVar(&stripImages, "strip-images", false, "remove Google-exported base64 image references")
	flags.Usage = func() { usage(os.Stderr, defaultOutDir()) }

	if wantsHelp(args) {
		usage(os.Stdout, defaultOutDir())
		return nil
	}
	if err := flags.Parse(args); err != nil {
		if errors.Is(err, flag.ErrHelp) {
			return nil
		}
		return err
	}

	parsedArgs := flags.Args()
	if len(parsedArgs) == 0 {
		usage(os.Stderr, defaultOutDir())
		return errors.New("missing Google Doc URL or document ID")
	}
	if len(parsedArgs) > 2 {
		usage(os.Stderr, defaultOutDir())
		return fmt.Errorf("too many arguments: %s", strings.Join(parsedArgs[2:], " "))
	}

	if len(parsedArgs) == 2 {
		if flagWasSet(flags, "out-dir") || flagWasSet(flags, "o") {
			return errors.New("use either --out-dir or positional OUT_DIR, not both")
		}
		outDir = parsedArgs[1]
	}

	docID, err := documentID(parsedArgs[0])
	if err != nil {
		return err
	}

	token, err := accessToken()
	if err != nil {
		return err
	}

	if fileName == "" {
		name, err := documentName(docID, token, userProject)
		if err != nil {
			fmt.Fprintf(os.Stderr, "gdoc2md: warning: could not read document name: %v; using document ID\n", err)
			name = docID
		}
		fileName = slug(name) + ".md"
	} else if strings.Contains(fileName, "/") || strings.Contains(fileName, string(os.PathSeparator)) {
		return errors.New("--file must be a filename, not a path; use --out-dir for directories")
	} else if filepath.Ext(fileName) == "" {
		fileName += ".md"
	}

	markdown, err := exportMarkdown(docID, token, userProject)
	if err != nil {
		return err
	}
	if stripImages {
		markdown = removeImageData(markdown)
	}

	outputPath, err := writeAtomically(outDir, fileName, markdown)
	if err != nil {
		return err
	}

	fmt.Println(outputPath)
	return nil
}

func wantsHelp(args []string) bool {
	for _, arg := range args {
		if arg == "--help" || arg == "-help" || arg == "-h" {
			return true
		}
	}
	return false
}

func defaultOutDir() string {
	if configured := os.Getenv("GDOC2MD_OUT_DIR"); configured != "" {
		return configured
	}
	return filepath.Join(os.TempDir(), "gdoc2md")
}

func usage(w io.Writer, defaultDir string) {
	fmt.Fprintf(w, `Usage:
  gdoc2md [options] URL_OR_DOC_ID [OUT_DIR]

Exports a Google Doc to markdown using your current gcloud auth session.
The output path is printed to stdout. Warnings and errors are printed to stderr.

Options:
  --out-dir DIR         Directory to write the markdown file (default %q)
  -o DIR               Alias for --out-dir
  --file NAME          Output filename relative to --out-dir
  --strip-images       Remove Google-exported base64 image references
  --user-project ID    Optional Google Cloud quota/billing project
  --help               Show this help

Environment:
  GDOC2MD_OUT_DIR      Optional default output directory
  GDOC2MD_USER_PROJECT Optional default for --user-project

Examples:
  gdoc2md "https://docs.google.com/document/d/abc123/edit"
  gdoc2md --out-dir .context "https://docs.google.com/document/d/abc123/edit"
  gdoc2md --strip-images --out-dir .context "https://docs.google.com/document/d/abc123/edit"
  gdoc2md --file style-guide.md abc123
`, defaultDir)
}

func flagWasSet(flags *flag.FlagSet, name string) bool {
	wasSet := false
	flags.Visit(func(f *flag.Flag) {
		if f.Name == name {
			wasSet = true
		}
	})
	return wasSet
}

func documentID(input string) (string, error) {
	input = strings.TrimSpace(input)
	if input == "" {
		return "", errors.New("empty Google Doc URL or document ID")
	}

	if strings.Contains(input, "://") {
		parsed, err := url.Parse(input)
		if err != nil {
			return "", fmt.Errorf("parse Google Doc URL: %w", err)
		}
		parts := strings.Split(parsed.Path, "/")
		for i, part := range parts {
			if part == "d" && i+1 < len(parts) && parts[i+1] != "" {
				return parts[i+1], nil
			}
		}
		return "", fmt.Errorf("could not find document ID in URL: %s", input)
	}

	if strings.ContainsAny(input, "/?#") {
		return "", fmt.Errorf("invalid document ID: %s", input)
	}
	return input, nil
}

func accessToken() (string, error) {
	cmd := exec.Command("gcloud", "auth", "print-access-token")
	output, err := cmd.Output()
	if err != nil {
		var exitErr *exec.ExitError
		if errors.As(err, &exitErr) {
			return "", fmt.Errorf("run gcloud auth print-access-token: %w: %s", err, strings.TrimSpace(string(exitErr.Stderr)))
		}
		return "", fmt.Errorf("run gcloud auth print-access-token: %w", err)
	}

	token := strings.TrimSpace(string(output))
	if token == "" {
		return "", errors.New("gcloud returned an empty access token")
	}
	return token, nil
}

func documentName(docID, token, userProject string) (string, error) {
	endpoint := fmt.Sprintf("https://www.googleapis.com/drive/v3/files/%s?fields=name", url.PathEscape(docID))
	body, contentType, err := googleGet(endpoint, token, userProject)
	if err != nil {
		return "", err
	}
	if strings.Contains(contentType, "application/json") {
		var response struct {
			Name string `json:"name"`
		}
		if err := json.Unmarshal(body, &response); err != nil {
			return "", fmt.Errorf("decode file metadata response: %w", err)
		}
		if response.Name == "" || response.Name == "null" {
			return "", errors.New("file metadata response did not include a name")
		}
		return response.Name, nil
	}
	return "", fmt.Errorf("unexpected metadata content type: %s", contentType)
}

func exportMarkdown(docID, token, userProject string) ([]byte, error) {
	endpoint := fmt.Sprintf(
		"https://www.googleapis.com/drive/v3/files/%s/export?mimeType=%s",
		url.PathEscape(docID),
		url.QueryEscape("text/markdown"),
	)
	body, contentType, err := googleGet(endpoint, token, userProject)
	if err != nil {
		return nil, err
	}
	if strings.Contains(contentType, "application/json") && json.Valid(body) {
		return nil, fmt.Errorf("export returned JSON instead of markdown: %s", summarizeAPIError(body))
	}
	return body, nil
}

func googleGet(endpoint, token, userProject string) ([]byte, string, error) {
	client := &http.Client{Timeout: 60 * time.Second}
	req, err := http.NewRequest(http.MethodGet, endpoint, nil)
	if err != nil {
		return nil, "", err
	}
	req.Header.Set("Authorization", "Bearer "+token)
	if userProject != "" {
		req.Header.Set("X-Goog-User-Project", userProject)
	}

	resp, err := client.Do(req)
	if err != nil {
		return nil, "", err
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, "", err
	}
	if resp.StatusCode < 200 || resp.StatusCode > 299 {
		return nil, "", fmt.Errorf("Google API returned %s: %s", resp.Status, summarizeAPIError(body))
	}

	return body, resp.Header.Get("Content-Type"), nil
}

func summarizeAPIError(body []byte) string {
	var response apiError
	if err := json.Unmarshal(body, &response); err == nil && response.Error.Message != "" {
		if response.Error.Status != "" {
			return fmt.Sprintf("%s (%s)", response.Error.Message, response.Error.Status)
		}
		return response.Error.Message
	}

	body = bytes.TrimSpace(body)
	if len(body) > 500 {
		body = append(body[:500], []byte("...")...)
	}
	return string(body)
}

func slug(input string) string {
	input = strings.ToLower(input)
	var builder strings.Builder
	lastDash := false
	for _, r := range input {
		if (r >= 'a' && r <= 'z') || (r >= '0' && r <= '9') {
			builder.WriteRune(r)
			lastDash = false
			continue
		}
		if !lastDash {
			builder.WriteRune('-')
			lastDash = true
		}
	}

	result := strings.Trim(builder.String(), "-")
	if result == "" || result == "null" {
		return "google-doc"
	}
	return result
}

func removeImageData(markdown []byte) []byte {
	output := string(markdown)
	inlineImage := regexp.MustCompile(`!\[\]\[image[0-9]+\]`)
	imageDefinition := regexp.MustCompile(`(?m)^\[image[0-9]+\]: <data:image/[^>]+>\n?`)
	output = inlineImage.ReplaceAllString(output, "[image omitted]")
	output = imageDefinition.ReplaceAllString(output, "")
	return []byte(output)
}

func writeAtomically(outDir, fileName string, contents []byte) (string, error) {
	if err := os.MkdirAll(outDir, 0o755); err != nil {
		return "", fmt.Errorf("create output directory: %w", err)
	}

	outputPath := filepath.Join(outDir, fileName)
	tmp, err := os.CreateTemp(outDir, "."+fileName+".*.tmp")
	if err != nil {
		return "", fmt.Errorf("create temporary file: %w", err)
	}
	tmpPath := tmp.Name()
	defer os.Remove(tmpPath)

	if _, err := tmp.Write(contents); err != nil {
		tmp.Close()
		return "", fmt.Errorf("write temporary file: %w", err)
	}
	if err := tmp.Close(); err != nil {
		return "", fmt.Errorf("close temporary file: %w", err)
	}
	if err := os.Rename(tmpPath, outputPath); err != nil {
		return "", fmt.Errorf("move temporary file into place: %w", err)
	}

	return outputPath, nil
}
