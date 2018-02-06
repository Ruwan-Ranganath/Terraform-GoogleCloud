resource "google_sql_database_instance" "proddb" {
  name = "database-production"
  region = "${var.gcloud-region}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "users" {
  name      = "users-db"
  instance  = "${google_sql_database_instance.proddb.name}"
  charset   = "latin1"
  collation = "latin1_swedish_ci"
}
    