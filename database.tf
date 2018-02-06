resource "google_sql_database_instance" "proddb" {
  name = "database-production"
  region = "${var.gcloud-region}"
#   database_version = "MYSQL_5_7" // define the db type , default is mysql 5.7

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "users" {
  name     = "${var.sql-user}"
  instance = "${google_sql_database_instance.proddb.name}"
  host     = "${var.sql-host}"
  password = "${var.sql-password}"
}

    
# # Create Sample Table 
# resource "google_sql_database" "users" {
#   name      = "users-db"
#   instance  = "${google_sql_database_instance.proddb.name}"
#   charset   = "latin1"
#   collation = "latin1_swedish_ci"
# }
