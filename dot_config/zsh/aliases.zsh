#!/bin/sh
alias l='lvim'
alias j='z'
alias f='zi'
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/nvim/'
alias yay="paru"
# alias lvim="env TERM=wezterm lvim"

# alias lvim='nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim"'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Remarkable
alias remarkable_ssh='ssh root@10.11.99.1'
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

# systemd
alias mach_list_systemctl="systemctl list-unit-files --state=enabled"

alias mach_java_mode="export SDKMAN_DIR="$HOME/.sdkman" && [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh""

alias m="git checkout master"
alias s="git checkout stable"


alias k='kubectl'
alias kn='kubectl ns'
alias kx='kubectl ctx'
alias kk='k9s'
alias kube='export KUBECONFIG="/Users/samhuang/.kube/$(ls ~/.kube | fzf)"'

alias tg='terragrunt'


alias jdk11="export JAVA_HOME=$JAVA_11_HOME"
alias jdk14="export JAVA_HOME=$JAVA_14_HOME"
alias jdk17="export JAVA_HOME=$JAVA_17_HOME"
alias asdf_java="source ~/.asdf/plugins/java/set-java-home.zsh"

alias vim="nvim"
alias vi="nvim"

alias t="tmux"
alias tn="tmux new-session"
alias tk="tmux kill-session"
# alias ta="tmux attach"
# alias tr="tmux rename-session"
# alias trs="tmux rename-session -t $(tmux display-message -p '#S')"
alias mux="tmuxinator"

alias cat="bat"
alias tree="eza -T"
alias ls="exa"
alias r="ranger"


alias pn="pnpm"

alias c="cursor"

alias ca="cursor-agent"

alias cl='http_proxy="http://localhost:7890" claude'
alias ccc='npx copilot-api@latest start --claude-code'

alias proxy='export https_proxy="http://localhost:7890";export http_proxy="http://localhost:7890";echo -e "Proxy on"'

alias jira='jiratui ui --assignee-account-id 712020:faf89636-b70f-4485-9e9d-fe2391dec1c6'

alias tg='terragrunt'
alias tf='tofu'


alias clauded="claude --dangerously-skip-permissions"
alias geminid="gemini --approval-mode yolo"

alias vibe="npx vibe-kanban"
alias opencode="https_proxy=http://localhost:7890 http_proxy=http://localhost:7890 NO_PROXY=localhost,127.0.0.1 opencode"


alias uat-db='KUBECONFIG=/Users/samhuang/.kube/ali-vdc-uat kubectl port-forward pod/infra-db-mysql-0 -n mysql 3306:3306'

alias upgrade-at="brew upgrade --cask --no-quarantine antigravity-tools"

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi


if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\""
  alias catt="bat --theme \"Visual Studio Dark+\""
fi


case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	# alias ls='ls -G'
	;;

Linux)
	#alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
