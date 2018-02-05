# Create a new instance
resource "google_compute_instance" "monitoring1" {
   name = "monitoring1"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["das"]
   metadata {
    product = "monitoring1"
  }
   metadata_startup_script = "echo hi > /test.txt"
   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
   }
}
network_interface {
   network = "${google_compute_network.platform.name}"
   access_config {}
}
service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }
}



# Create a new instance
resource "google_compute_instance" "monitoring2" {
   name = "monitoring2"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["das"]
   metadata {
    product = "monitoring2"
  }
   metadata_startup_script = "echo hi > /test1.txt"
   boot_disk {
      initialize_params {
      image = "ubuntu-1604-lts"
   }
}
network_interface {
   network = "default"
   access_config {}
}
service_account {
   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
   }
}




resource "google_compute_backend_bucket" "logstorage" {
  name        = "log-storage-bucket"
  description = "Monitoring Node Logs"
  bucket_name = "${google_storage_bucket.log_bucket.name}"
  enable_cdn  = true
}

resource "google_storage_bucket" "log_bucket" {
  name     = "log-store-bucket"
  location = "EU"
}
