provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

data "google_client_config" "current" {
  
}