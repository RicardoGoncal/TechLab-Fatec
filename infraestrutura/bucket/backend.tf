terraform {
  backend "gcs" {
    bucket = "terraform-state-fatec"
    prefix = "resources/bucket/terraform-bucket-state.tfstate"
  }
}
