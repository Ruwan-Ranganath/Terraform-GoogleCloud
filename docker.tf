data "google_container_registry_repository" {}

output "gcr_location" {
    value = "${data.google_container_registry_repository.repository_url}"
}
