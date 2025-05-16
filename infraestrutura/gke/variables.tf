variable "project_id" {
  type = string
  default = "mythic-attic-450700-r8"
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

variable "gke_name" {
  type = string
  default = "fatec-gke-cluster"
}

variable "gke_zones" {
  type = list(string)
  default = ["us-central1-a"]
}

variable "gke_num_nodes" {
  type = number
  default = 1
}