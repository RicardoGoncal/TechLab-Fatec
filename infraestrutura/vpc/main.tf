# Criação de VPC para o Cluster k8s

resource "google_compute_network" "fatec_vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

# Criação da Subnet para o Cluster
resource "google_compute_subnetwork" "fatec_subnet" {
  name = var.subnet_name
  region = var.region
  network = google_compute_network.fatec_vpc.name
  ip_cidr_range = "10.0.0.0/24"

  # Adiciona os intervalos para uso do Cluster GKE
  secondary_ip_range {
    range_name = "gke-001-pods"
    ip_cidr_range = "10.1.0.0/24"
  }

  secondary_ip_range {
    range_name = "gke-001-services"
    ip_cidr_range = "10.2.0.0/25"
  }
}