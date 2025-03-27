# DataSource para buscar a VPC existente
data "google_compute_network" "vpc_network" {
  name = var.vpc_name  # Nome da VPC (rede virtual) existente no Google Cloud.
  project = var.project_id  # ID do projeto onde a VPC está localizada.
}

# DataSource para buscar a Subnet Existente
data "google_compute_subnetwork" "subnet" {
  name = var.subnet_name  # Nome da sub-rede dentro da VPC.
  region = var.region  # Região onde a sub-rede está localizada.
  project = var.project_id  # ID do projeto no Google Cloud.
}

# Criação do Cluster GKE (Google Kubernetes Engine)
module "gke_cluster" {
  source = "terraform-google-modules/kubernetes-engine/google"  # Módulo Terraform oficial para criar um cluster GKE.
  project_id = var.project_id  # ID do projeto no Google Cloud.
  name = var.gke_name  # Nome do cluster Kubernetes.
  region = var.region  # Região onde o cluster será criado.
  zones = var.gke_zones  # Lista de zonas dentro da região para distribuir os nós do cluster.
  network = data.google_compute_network.vpc_network.name  # Associa o cluster à VPC existente.
  subnetwork = data.google_compute_subnetwork.subnet.name  # Usa a sub-rede existente na VPC.
  deletion_protection = false  # Define se a proteção contra exclusão do cluster estará ativada (false significa que pode ser deletado).

  # Configurações do cluster
  ip_range_pods = "gke-001-pods"  # Intervalo de IPs usado pelos Pods do cluster.
  ip_range_services = "gke-001-services"  # Intervalo de IPs usado pelos serviços dentro do cluster.

  # Configuração do Node Pool (grupo de nós que executam os containers)
  node_pools = [{
    name = "fatec-pool"  # Nome do grupo de nós.
    machine_type = "e2-standard-2"  # Tipo de máquina para os nós do cluster (CPU, memória).
    node_count = var.gke_num_nodes  # Número inicial de nós no cluster.
    disk_size_db = 40  # Tamanho do disco em GB para cada nó.
    disk_type = "pd-standard"  # Tipo de disco (padrão: Persistent Disk - Standard).
  }]
}
