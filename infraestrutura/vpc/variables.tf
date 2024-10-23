variable "project_id" {
  type = string
  default = "workshop-fatec"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "vpc_name" {
  type = string
  default = "fatec-vpc"
}

variable "subnet_name" {
  type = string
  default = "fatec-subnet"
}
