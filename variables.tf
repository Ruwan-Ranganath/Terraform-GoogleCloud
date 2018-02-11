#terraform-gcloud resources
variable "gcloud-region"    { default = "us-west1" }
variable "gcloud-zone"      { default = "us-west1-a" }
variable "gcloud-project"   { default = "wso2telcoubeexpansion" }
variable "platform-name"    { default = "wso2telcoubeexpansion"  }

#networks
variable "monitoring-network-name"    { default = "wso2telco-monitoring-network"  }


#mysql user variables 
variable "sql-user"         { default = "CloudSQLUser"}
variable "sql-password"     { default = "CloudSQLPassword"}  
variable "sql-host"         { default = "connect.example.com"}

#kubeClusterDetails
variable "kube-user"        { default = "kubeAdmin"}
variable "kube-password"    { default = "kubePassword1234567"}
variable "kube-name"        { default = "wso2telcokubecluster"}
variable "kube-nodes"       { default = "2"}
variable "kube-version"     { default = "1.9.2-gke.1"}
variable "kube-sa"          { default = "terraform@wso2telcoubeexpansion.iam.gserviceaccount.com"}


#Instance Variable 
variable "os-type"          { default = "ubuntu-1604-lts"}

