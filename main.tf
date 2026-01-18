# 1. Create the additional data disk
resource "google_compute_disk" "data_disk" {
  name  = "extra-data-disk"
  type  = "pd-standard"
  zone  = var.zone
  size  = 10 # GB
}

# 2. Create the VM Instance
resource "google_compute_instance" "ubuntu_vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  # Boot Disk (Ubuntu)
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 20
    }
  }

  # Additional Disk Attachment
  attached_disk {
    source      = google_compute_disk.data_disk.id
    device_name = "data-disk"
  }

  # Network (uses the default VPC)
  network_interface {
    network = "default"
    access_config {
      # Include this block to give the VM an External IP
    }
  }
}