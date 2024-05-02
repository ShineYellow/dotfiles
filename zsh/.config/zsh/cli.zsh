#gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

#google-cloud-sdk
function init_gcloud() {
  [[ -s "$(brew --prefix)/share/google-cloud-sdk" ]] && source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  [[ -s "$(brew --prefix)/share/google-cloud-sdk" ]] && source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
}
