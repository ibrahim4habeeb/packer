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



build {


  # Make sure cloud-init has finished
  provisioner "shell" {
    inline = ["echo 'Wait for cloud-init...' && /usr/bin/cloud-init status --wait"]
}
}
