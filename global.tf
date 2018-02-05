#create network interface 
resource "google_compute_network" "platform" {
  name       = "${var.platform-name}"
}


#Open ports
resource "google_compute_firewall" "ssh" {
  name    = "${var.platform-name}-ssh"
  network = "${google_compute_network.platform.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

   source_ranges = ["0.0.0.0/0"]
}

#Create subnet
resource "google_compute_subnetwork" "dev" {
  name          = "dev-${var.platform-name}-${var.gcloud-region}"
  ip_cidr_range = "10.1.2.0/24"
  network       = "${google_compute_network.platform.self_link}"
  region        = "${var.gcloud-region}"
}
