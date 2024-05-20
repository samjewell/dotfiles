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
