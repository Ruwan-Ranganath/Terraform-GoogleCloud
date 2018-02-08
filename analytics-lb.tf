resource "google_compute_region_backend_service" "analytics-lb" {
  name             = "analytics-lb"
  description      = "analytics-lb"
  protocol         = "TCP"
  timeout_sec      = 10
  session_affinity = "CLIENT_IP"

  backend {
    group = "${google_compute_instance.wso2telcoanalytics01.name}"
  }

  health_checks = ["${google_compute_health_check.default.self_link}"]
}


resource "google_compute_health_check" "default" {
  name               = "analytics-health-check"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "22"
  }
}   