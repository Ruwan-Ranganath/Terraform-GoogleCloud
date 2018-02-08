resource "google_compute_region_backend_service" "foobar" {
  name             = "blablah"
  description      = "Hello World 1234"
  protocol         = "TCP"
  timeout_sec      = 10
  session_affinity = "CLIENT_IP"

  backend {
    group = "${google_compute_region_instance_group_manager.foo.instance_group}"
  }

  health_checks = ["${google_compute_health_check.default.self_link}"]
}


resource "google_compute_health_check" "default" {
  name               = "test"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "80"
  }
}   