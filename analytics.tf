# Create a new instance
resource "google_compute_instance" "wso2telcoanalytics01" {
   name = "wso2telcoanalytics01"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["das"]
   metadata {
    product = "das"
  }   
   metadata_startup_script = "echo hi > /test.txt"
   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
   }
}
network_interface {
   network = "${google_compute_network.platform.name}"
   subnetwork = "${google_compute_subnetwork.dev.name}"
}
service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }
}



# Create a new instance
resource "google_compute_instance" "wso2telcoanalytics02" {
   name = "wso2telcoanalytics02"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["das"]
   metadata {
    product = "das"
  }
   metadata_startup_script = "echo hi > /test1.txt"
   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
   }
}
network_interface {
   network = "${google_compute_network.platform.name}"
   subnetwork = "${google_compute_subnetwork.dev.name}"
}
service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }
}
