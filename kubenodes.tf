# Create a new instance
resource "google_compute_instance" "puppetmaster" {
   name = "puppetmaster"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["puppetmaster"]
   metadata {
    product = "puppetmaster"
  }
   metadata_startup_script = "echo info@wso2telco.com > /test.txt"
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
resource "google_compute_instance" "bastion" {
   name = "bastion"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["bastion"]
   metadata {
    product = "bastion"
  }
   metadata_startup_script = "echo info@wso2telco.com > /test.txt"
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
resource "google_compute_instance" "dockerregistry" {
   name = "dockerregistry"
   machine_type = "f1-micro"
   zone = "${var.gcloud-zone}"
   tags = ["dockerregistry"]
   metadata {
    product = "dockerregistry"
  }
   metadata_startup_script = "echo info@wso2telco.com > /test.txt && apt install docker && docker run -d -p 5000:5000 --restart=always --name registry  -e REGISTRY_STORAGE_DELETE_ENABLED=true registry:2.3.1"
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
