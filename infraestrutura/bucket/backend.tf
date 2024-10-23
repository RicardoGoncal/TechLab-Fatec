terraform {
  backend "gcs" {
    bucket = "terraform-state-fatec"
  }
}
