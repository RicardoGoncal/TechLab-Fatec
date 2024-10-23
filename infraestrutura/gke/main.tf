# # DataSource para buscar a VPC existente
# data "google_compute_network" "vpc_network" {
#   name = var.vpc_name
#   project = var.project_id
# }

# # DataSource para buscar a Subnet Existente
# data "google_compute_subnetwork" "subnet" {
#   name = var.subnet_name
#   region = var.region
#   project = var.project_id
# }

# # Criação do Cluster GKE

# module "gke_cluster" {
#   source = "terraform-google-modules/kubernetes-engine/google"
#   project_id = var.project_id
#   name = var.gke_name
#   region = var.region
#   zones = var.gke_zones
#   network = data.google_compute_network.vpc_network.name
#   subnetwork = data.google_compute_subnetwork.subnet.name
#   deletion_protection = false

#   # Cluster settings
#   ip_range_pods = "gke-001-pods"
#   ip_range_services = "gke-001-services"

#   node_pools = [{
#     name = "fatec-pool"
#     machine_type = "e2-medium"
#     node_count = var.gke_num_nodes
#     disk_size_db = 40
#     disk_type = "pd-standard"
#   }]
# }