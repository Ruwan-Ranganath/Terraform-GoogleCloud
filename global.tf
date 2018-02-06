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


# Firewall Groups Start =====================================

#Monitoring Security Group
# Rules Explanation
# ICMP PING // should be disabled
# 22 SSH
# 80 HTTP for Nagios
# 443  HTTPs for Nagios
# 9200 Elasticsearch
# 5043 Logstash
# 5601 Kibana
# 5666 Nagios NRPE
resource "google_compute_firewall" "monitoring" {
  name    = "${var.platform-name}-monitoring"
  network = "${google_compute_network.platform.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "9200", "5043", "5601", "5666"]
  }

   source_ranges = ["0.0.0.0/0"]
}



#Bastion Security Group
# Rules Explanation
# ICMP
# 22
resource "google_compute_firewall" "bastion" {
  name    = "${var.platform-name}-bastion"
  network = "${google_compute_network.platform.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

   source_ranges = ["0.0.0.0/0"]
}




#Nginx Security Group
# Rules Explanation
# ICMP
# 80 HTTP
# 22 SSH
# 9200 HTTPS 
resource "google_compute_firewall" "nginx" {
  name    = "${var.platform-name}-nginx"
  network = "${google_compute_network.platform.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "9200"]
  }

   source_ranges = ["0.0.0.0/0"]
}



# Firewall Groups End  =====================================

#Create subnet
resource "google_compute_subnetwork" "dev" {
  name          = "dev-${var.platform-name}-${var.gcloud-region}"
  ip_cidr_range = "10.1.2.0/24"
  network       = "${google_compute_network.platform.self_link}"
  region        = "${var.gcloud-region}"
}
