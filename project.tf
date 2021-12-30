resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}

resource "google_compute_subnetwork" "primary-subnet" {
  name          = "test-subnetwork"
  ip_cidr_range = var.primary-ip-cidr
  region        = var.location
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_instance" "main-instance" {
  name         = "main-instance"
  machine_type = "e2-micro"
  zone         = var.primary-az

  tags = ["name", "main-instance"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  

  metadata_startup_script = "echo hi > /test.txt"

  

}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}
