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