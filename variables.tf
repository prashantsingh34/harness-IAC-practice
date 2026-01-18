variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "vm_name" {
  default = "harness-ubuntu-vm"
}

variable "state_file_bucket" {
  type = string
}