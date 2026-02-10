function merge_kubeconfig() {
    export KUBECONFIG=$(find ~/.kube -maxdepth 1 -type f -not -name 'kubectx' | tr '\n' ':')
    cp ~/.kube/config /tmp/config-backup
    kubectl config view --flatten > /tmp/all-in-one-kubeconfig.yaml
    mv /tmp/all-in-one-kubeconfig.yaml ~/.kube/config
    kubectl config get-clusters
    unset KUBECONFIG
}