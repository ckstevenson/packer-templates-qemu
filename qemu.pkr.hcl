source "qemu" "windows" {
  iso_url           = var.iso_url 
  communicator      = "winrm"
  iso_checksum      = var.iso_checksum
  #iso_target_path   = var.iso_path
  output_directory  = "${ var.output_directory }/${ var.os_version }"
  disk_size         = "40G"
  format            = "qcow2"
  http_directory    = "${ var.boot_config }/${ var.os_family }/${ var.os_version }"
  accelerator       = "kvm"
  winrm_username    = var.connection_username
  winrm_password    = var.connection_password
  vm_name           = "${ var.os_family }_${ var.os_version }_template.qcow2"
  net_device        = var.vm_network
  disk_interface    = "virtio"
#  headless          = true
  boot_wait         = "2s"
  cpus              = var.num_cpu
  memory            = var.vm_ram
  boot_command      = var.boot_command
}

source "qemu" "linux" {
  communicator      = "ssh"
  iso_url           = var.iso_url 
  iso_checksum      = var.iso_checksum
  #iso_target_path   = var.iso_path
  output_directory  = "${ var.output_directory }/${ var.os_family }"
  disk_size         = "20G"
  format            = "qcow2"
  http_directory    = "${ var.boot_config }/${ var.os_family }/"
  accelerator       = "kvm"
  ssh_username      = var.connection_username
  ssh_password      = var.connection_password
  ssh_timeout       = "20m"
  vm_name           = "${ var.os_family }_${ var.os_version }_template.qcow2"
  net_device        = var.vm_network
  disk_interface    = "virtio"
#  headless          = true
  boot_wait         = "2s"
  cpus              = var.num_cpu
  memory            = var.vm_ram
  boot_command      = var.boot_command
}

source "qemu" "arch" {
  communicator      = "ssh"
  iso_url           = var.iso_url 
  iso_checksum      = var.iso_checksum
  #iso_target_path   = var.iso_path
  output_directory  = "${ var.output_directory }/${ var.os_family }"
  disk_size         = "20G"
  format            = "qcow2"
  http_directory    = "${ var.boot_config }/${ var.os_family }/"
  accelerator       = "kvm"
  ssh_username      = var.connection_username
  ssh_password      = var.connection_password
  vm_name           = "${ var.os_family }_${ var.os_version }_template.qcow2"
  net_device        = var.vm_network
  disk_interface    = "virtio"
  headless          = true
  boot_wait         = "2s"
  cpus              = var.num_cpu
  memory            = var.vm_ram
  boot_command      = var.boot_command
}

build {
  sources = ["source.qemu.arch"]
    #provisioner "file" {
    #  source = "scripts/arch_installer.sh"
    #  destination = "/root/scripts/"
    #}
    provisioner "shell" {
      #execute_command = "sh arch_installer.sh" # This runs the scripts with sudo
      scripts = ["./scripts/arch_installer.sh"]
    }
}

build {
  sources = ["source.qemu.windows"]
}

build {
  sources = ["source.qemu.linux"]
    provisioner "ansible" {
        playbook_file = "./ansible/linux_provisioner.yml"
        user = "user"
        #use_proxy = false
        extra_arguments = [
            "-b",
            "--extra-vars",
            "ansible_become_password=changeme",
        ]
    }
}
