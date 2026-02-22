eval "$(/Users/samhuang/.local/bin/mise activate zsh)"
eval "$(direnv hook zsh)"


. "$HOME/.atuin/bin/env"
# eval "$(atuin init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

# eval "$(fnm env)"
eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"
