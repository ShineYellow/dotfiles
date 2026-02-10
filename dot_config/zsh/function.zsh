
uat_huawei_env() {
  export DSN="root:zillizinfra@tcp(127.0.0.1:3306)/infra?charset=utf8mb4&parseTime=True&loc=UTC" 
  export HUAWEICLOUD_SDK_AK=HPUAAGJNEJ4WD7IKQAWC
  export HUAWEICLOUD_SDK_SK=h3ibLwRz4TOUupm5pF7jHS2PEGT4VdulvfhOxfnv
}

alias uat-db='KUBECONFIG=/Users/samhuang/.kube/ali-vdc-uat kubectl port-forward pod/infra-db-mysql-0 -n mysql 3306:3306'
