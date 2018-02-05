# Specifcy the provider
provider "google"{
credentials = "${file("terraform-account.json")}"
project = "${var.gcloud-project}"
region = "${var.gcloud-region}"
}
