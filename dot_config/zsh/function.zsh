function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function nn() {
   nvim "$(find /Users/samhuang/git -maxdepth 1 -mindepth 1 -type d | fzf)"
}

uat_huawei_env() {
  export DSN="root:zillizinfra@tcp(127.0.0.1:3306)/infra?charset=utf8mb4&parseTime=True&loc=UTC" 
  export HUAWEICLOUD_SDK_AK=HPUAAGJNEJ4WD7IKQAWC
  export HUAWEICLOUD_SDK_SK=h3ibLwRz4TOUupm5pF7jHS2PEGT4VdulvfhOxfnv
}


function tt(){
   tmux attach -t $(tmux list-sessions -F '#{session_name}' | fzf)
}

function merge_kubeconfig() {
    export KUBECONFIG=$(find ~/.kube -maxdepth 1 -type f -not -name 'kubectx' | tr '\n' ':')
    cp ~/.kube/config /tmp/config-backup
    kubectl config view --flatten > /tmp/all-in-one-kubeconfig.yaml
    mv /tmp/all-in-one-kubeconfig.yaml ~/.kube/config
    kubectl config get-clusters
    unset KUBECONFIG
}


# rsrg search rust library via keyword, e.g.:
# rsrg "HashMap"
# rsrg "impl<T> FromIterator"
function rsrg() {
  local SYSROOT
  SYSROOT="$(rustc --print sysroot)"
  rg "$@" "$SYSROOT/lib/rustlib/src/rust/library/"
}

# rsdoc open rust std library doc in browser
function rsdoc() {
  rustup doc --std
}


# 定义 iTerm2 用户变量函数
function iterm2_print_user_vars() {
  # 设置一个名为 k8s_config 的 iTerm2 变量
  # 如果 KUBECONFIG 为空，则显示 "Default"
  iterm2_set_user_var k8s_config $(basename "${KUBECONFIG:-Default}")
  
  # 进阶版：如果你想显示当前的 Context 名字（更直观）
  # iterm2_set_user_var k8s_ctx $(kubectl config current-context 2>/dev/null || echo "N/A")
}
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


function gcd {
  gtr cd "$(git gtr list --porcelain | awk '{print $2}' | fzf)" ; zellij --layout ai
}

function ggf {
  gtr cd "$(git gtr list --porcelain | awk '{print $2}' | fzf)" ; zellij --layout ai
}
