terraform {
  backend "gcs" {
    bucket = "terraform-state-fatec"
    prefix = "resources/vpc/terraform-vpc-state.tfstate"
    # credentials = file("<YOUR-CREDENTIALS-FILE>.json")
  }
}
