terraform {
  required_providers {
    virtualbox = {
    source = "terra-farm/virtualbox"
    version = "0.2.2-alpha.1"
    }
  }
}


resource "virtualbox_vm" "vbox_vm" {
    name = var.vm_name
    image = var.vm_image
    memory = var.vm_ram
    cpus = var.vm_cpus

network_adapter {
    host_interface = var.vm_netadapter
    type = "bridge"
    }
}