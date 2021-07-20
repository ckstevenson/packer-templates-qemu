variable "connection_username" {
    type = string
    default = "user"
}
variable "connection_password" {
    type = string
    default = "changeme"
}
variable "iso_checksum" {
    type = string
}
variable "iso_url" {
    description = "The download url for the ISO"
}
variable "output_directory" {
    type = string
    default = "/home/cameron/Documents/Development/templates"
}
variable "os_family" {
    type = string
    description = "OS Family builds the paths needed for packer"
}
variable "os_version" {
    type = string
    description = "OS version builds the paths needed for packer"
}
variable "root_disk_size" {
    type = number
    default = 25600
}
variable "vm_network" {
    type = string
    description = "Virtual network for the image"
    default = "virtio-net"
}
variable "num_cpu" {
    type = number
    default = 2
}
variable "num_cores" {
    type = number
    default = 1
}
variable "vm_ram" {
    type = number
    default = 4096
}
variable "boot_command" {}
variable "boot_config" {
    type = string
    default = "boot_config"
}
variable "ansible_playbooks" {
    description = "The download url for the ISO"
}
