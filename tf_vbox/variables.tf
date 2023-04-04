variable "vm_name" {
    type = string
}

variable "vm_image" {
    type=string
    default="debian/debian11"
}

variable "vm_ram" {
    type=string
    default="4096 mib"
}

variable "vm_cpus" {
    type=number
    default=2
}

variable "vm_netadapter" {
    type=string
    default="vxlan0"
}