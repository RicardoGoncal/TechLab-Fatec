# Criação de VPC para o Cluster Kubernetes (k8s)
resource "google_compute_network" "fatec_vpc" {
  name = var.vpc_name  # Nome da VPC (rede virtual) que será criada.
  auto_create_subnetworks = false  # Desativa a criação automática de sub-redes, pois criaremos uma manualmente.
}

# Criação da Subnet para o Cluster
resource "google_compute_subnetwork" "fatec_subnet" {
  name = var.subnet_name  # Nome da sub-rede dentro da VPC.
  region = var.region  # Região onde a sub-rede será criada.
  network = google_compute_network.fatec_vpc.name  # Associa esta sub-rede à VPC criada acima.
  ip_cidr_range = "10.0.0.0/23"  # Intervalo de endereços IP para essa sub-rede.

  # Adiciona os intervalos de IP para uso do Cluster GKE
  secondary_ip_range {
    range_name = "gke-001-pods"  # Nome do intervalo de IPs para os Pods do cluster.
    ip_cidr_range = "10.1.0.0/24"  # Faixa de IPs reservada para os Pods.
  }

  secondary_ip_range {
    range_name = "gke-001-services"  # Nome do intervalo de IPs para os Services do cluster.
    ip_cidr_range = "10.2.0.0/24"  # Faixa de IPs reservada para os Services.
  }
}
