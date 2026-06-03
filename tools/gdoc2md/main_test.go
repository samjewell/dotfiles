package main

import (
	"strings"
	"testing"
)

func TestDocumentID(t *testing.T) {
	tests := []struct {
		name  string
		input string
		want  string
	}{
		{
			name:  "doc URL",
			input: "https://docs.google.com/document/d/test-id-not-a-real-id/edit?tab=t.0#heading=h.example",
			want:  "test-id-not-a-real-id",
		},
		{
			name:  "bare ID",
			input: "abc123_DEF",
			want:  "abc123_DEF",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := documentID(tt.input)
			if err != nil {
				t.Fatalf("documentID() error = %v", err)
			}
			if got != tt.want {
				t.Fatalf("documentID() = %q, want %q", got, tt.want)
			}
		})
	}
}

func TestDocumentIDRejectsInvalidURL(t *testing.T) {
	_, err := documentID("https://example.com/not-a-google-doc")
	if err == nil {
		t.Fatal("documentID() error = nil, want error")
	}
}

func TestSlug(t *testing.T) {
	got := slug("Style Guide")
	want := "style-guide"
	if got != want {
		t.Fatalf("slug() = %q, want %q", got, want)
	}
}

func TestRemoveImageData(t *testing.T) {
	input := []byte("before ![][image1] after\n[image1]: <data:image/png;base64,abcdef>\nkept\n")
	got := string(removeImageData(input))
	if strings.Contains(got, "data:image") {
		t.Fatalf("removeImageData() kept image data: %q", got)
	}
	if !strings.Contains(got, "[image omitted]") {
		t.Fatalf("removeImageData() did not replace inline image: %q", got)
	}
	if !strings.Contains(got, "kept") {
		t.Fatalf("removeImageData() removed normal content: %q", got)
	}
}
