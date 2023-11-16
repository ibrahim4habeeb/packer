packer {
  required_version = ">= 1.7.7"
  required_plugins {
    azure = {
      version = "~>1.0"
      source  = "github.com/hashicorp/azure"
    }
  }
}

locals {
  timestamp  = regex_replace(timestamp(), "[- TZ:]", "")
  //image_name = "${var.prefix}-ubuntu20-${local.timestamp}"
}

source "azure-arm" "base" {
  os_type                   = "Linux"

  vm_size                   = "Standard_B2s"

  # Source image
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-focal"
  image_sku       = "20_04-lts-gen2"
  image_version   = "latest"

  # Destination image


  azure_tags = {
    owner      = var.owner
    department = var.department
    build-time = local.timestamp
  }
  use_azure_cli_auth = true
}

build {

  sources = [
    "source.azure-arm.base"
  ]
  # Make sure cloud-init has finished
  provisioner "shell" {
    inline = ["echo 'Wait for cloud-init...' && /usr/bin/cloud-init status --wait"]
}
}
