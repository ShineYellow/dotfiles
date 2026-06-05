#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
typeset -gU path PATH

path_prepend() {
    [[ -d "$1" ]] && path=("$1" $path)
}

HISTSIZE=1000000
SAVEHIST=1000000
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"
# export TERMINAL="kitty"
# export BROWSER="brave"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/.local/share/go/bin"
path_prepend "$HOME/.fnm"
path_prepend "$HOME/.local/share/neovim/bin"
export XDG_CURRENT_DESKTOP="Wayland"
# kubectl krew
path_prepend "${KREW_ROOT:-$HOME/.krew}/bin"
# opencode
path_prepend "$HOME/.opencode/bin"
#export PATH="$PATH:./node_modules/.bin"
# bun
export BUN_INSTALL="$HOME/.bun"
path_prepend "$BUN_INSTALL/bin"


#export KUBECONFIG=$(find ~/.kube -maxdepth 1 -type f -not -name 'kubectx' | tr '\n' ':')




# JAVA
#export JAVA_HOME="/usr/local/opt/openjdk@11"
#export JAVA_HOME="/usr/local/opt/java"
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.17.jdk/Contents/Home
export JAVA_14_HOME=/Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home
export JAVA_17_HOME=/Library/Java/JavaVirtualMachines/jdk-17.0.5.jdk/Contents/Home
#export PATH="$JAVA_HOME/bin:$PATH"

# MAVEN
#export MAVEN_HOME="/opt/apache-maven-3.8.6"
#export PATH="$MAVEN_HOME/bin:$PATH"


# for terraform provider cache with tofu 
export TG_PROVIDER_CACHE_DIR=/Users/samhuang/.terraform.d/plugin-cache

# export GOOGLE_CLOUD_PROJECT="gen-lang-client-0549631171"

# Homebrew auto update is slow, so disable it
export HOMEBREW_NO_AUTO_UPDATE=1

# GOBIN
#export PATH="$GOBIN:$PATH"
[ -f ~/.env ] && { set -a; source ~/.env; set +a; }
unset -f path_prepend
