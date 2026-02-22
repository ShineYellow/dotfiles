
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

