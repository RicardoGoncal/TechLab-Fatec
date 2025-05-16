terraform {
  backend "gcs" {
    bucket = "terraform-state-fatec"
    prefix = "resources/gke/terraform-gke-state.tfstate"
    # credentials = file("<YOUR-CREDENTIALS-FILE>.json")
  }
}
