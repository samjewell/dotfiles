# Run brew.sh first, so gh is installed and can be used
gh auth login
gh config set git_protocol https
gh auth setup-git

# Configure gpg-agent with extended cache timeout
# so that I don't have to enter my passphrase every time I commit
mkdir -p ~/.gnupg && cat > ~/.gnupg/gpg-agent.conf << 'EOF'
# Cache passphrase for 8 hours after last use
default-cache-ttl 28800

# Maximum cache time of 24 hours regardless of use
max-cache-ttl 86400

# Use macOS pinentry for passphrase prompts
pinentry-program /opt/homebrew/opt/pinentry-mac/bin/pinentry-mac
EOF

gpgconf --kill gpg-agent # restart gpg-agent to apply the new config

# Remove any SSH URL rewrite rule (may have been set by 1Password SSH setup)
git config --global --unset url.ssh://git@github.com/.insteadof 2>/dev/null || true

# Rewrite all GitHub SSH URLs to HTTPS (for gh CLI authentication)
# Handles both SCP-style (git@github.com:) and SSH URL (ssh://git@github.com/)
git config --global url."https://github.com/".insteadOf "ssh://git@github.com/"
git config --global --add url."https://github.com/".insteadOf "git@github.com:"

# git config --global core.hooksPath ~/dotfiles/commit_hooks
git config --global branch.autoSetupMerge simple
git config --global commit.verbose true
git config --global core.autocrlf false # https://github.com/hashicorp/terraform-provider-aws/issues/5011#issuecomment-717107831
git config --global core.excludesfile "/Users/samjewell/dotfiles/.gitignore_global"
git config --global core.mergeoptions --no-edit
git config --global diff.compactionHeuristic true
git config --global diff.renameLimit 5500
git config --global init.defaultBranch main
git config --global pull.ff only
git config --global push.autoSetupRemote true
git config --global push.default current
git config --global rebase.autoStash true
git config --global remote.origin.prune true
git config --global rerere.enabled true
git config --global user.email "2903904+samjewell@users.noreply.github.com"
git config --global user.name "Sam Jewell"
git config --global advice.skippedCherryPicks false
git config --global core.commentChar ";"
# Configure Git pager, to play nicely with Cursor AI Agent
git config --global core.pager "less -FRX" # -F: quit if output fits on one screen, -R: allow colors, -X: don't clear screen
git config --global pager.branch false # Don't page branch output
git config --global pager.tag false # Don't page tag output

# Configure Git signing with OpenPGP
git config --global --unset gpg.ssh.program 2>/dev/null || true  # Remove any leftover 1Password SSH signing config
git config --global gpg.format openpgp
git config --global user.signingkey F78CB5B57DF9B499
git config --global commit.gpgsign true



gh auth refresh -h github.com -s admin:gpg_key

# Add GPG key to GitHub (delete existing first if present, to handle key updates)
existing_key_id=$(gh api user/gpg_keys --jq '.[] | select(.key_id == "F78CB5B57DF9B499") | .id' 2>/dev/null)
if [ -n "$existing_key_id" ]; then
  gh api -X DELETE "user/gpg_keys/$existing_key_id"
fi
gpg --armor --export F78CB5B57DF9B499 | gh gpg-key add -

# NOTE: Ensure your GPG key has a UID matching your git user.email for verified commits.
# To add an email to your GPG key: gpg --edit-key F78CB5B57DF9B499, then "adduid", then "save"
