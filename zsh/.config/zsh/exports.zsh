#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.fnm:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export XDG_CURRENT_DESKTOP="Wayland"
#export PATH="$PATH:./node_modules/.bin"
# eval "$(fnm env)"
eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/.miniconda/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#export KUBECONFIG=$(find ~/.kube -maxdepth 1 -type f -not -name 'kubectx' | tr '\n' ':')


# http proxy
# export https_proxy="http://localhost:41091"
# export http_proxy="http://localhost:41091"

# kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

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

# GOBIN
#export PATH="$GOBIN:$PATH"
#export GOBIN="/Users/samhuang/.gvm/pkgsets/go1.19.3/global/bin"
