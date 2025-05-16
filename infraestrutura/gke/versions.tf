terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 6.14.0"
        # credentials = file("<YOUR-CREDENTIALS-FILE>.json")
    }
  }

  required_version = "~> 1.9.6"
}