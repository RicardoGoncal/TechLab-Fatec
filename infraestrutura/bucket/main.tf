# Criação de bucket para armazenar tfstate

resource "google_storage_bucket" "fatec_bucket" {
  name = var.bucket_name
  location = "US"

  force_destroy = true
  public_access_prevention = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "local_file" "default" {
  file_permission = "0644"
  filename = "${path.module}/backend.tf"

  content = <<-EOT
  terraform {
    backend "gcs" {
      bucket = "${google_storage_bucket.fatec_bucket.name}"
    }
  }
  EOT
}