resource "google_container_cluster" "primary" {
  name               = "${var.kube-name}"
  zone               = "${var.gcloud-zone}"
  initial_node_count = "${var.kube-nodes}"
  min_master_version = "${var.kube-version}"

## Enable this, if need to enable multi-zone kube nodes ( recommended )
#   additional_zones = [
#     "us-west1-b",
#  #   "us-west1-c",
#   ]


# enble kube cluster logging 
  # logging_service {
  #   logging = "logging.googleapis.com"
  # }

  maintenance_policy {
  daily_maintenance_window {
    start_time = "03:00"
  }
}

  master_auth {
    username = "${var.kube-user}"
    password = "${var.kube-password}"
  }


  ######  Node Configuration

  node_config {

    machine_type = "n1-highcpu-4"
    disk_size_gb = "50"
    

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      env = "dev"
    }

    tags = ["mc", "hub"]


    service_account  = "${var.kube-sa}"

    


  }


}


# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

// GCP Outputs

output "gcp_cluster_endpoint" {

    value = "${google_container_cluster.primary.endpoint}"

}

output "gcp_ssh_command" {  

    value = "ssh gcloud container clusters get-credentials ${var.kube-name} --zone ${var.gcloud-zone} --project ${var.gcloud-project}"
    

}

output "gcp_cluster_name" {

    value = "${google_container_cluster.primary.name}"

}