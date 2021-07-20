os_family = "arch"
os_version = "linux"
iso_url = "https://ftp.fau.de/archlinux/iso/2021.07.01/archlinux-2021.07.01-x86_64.iso"
iso_checksum = "5804cefb2e5e7498cb15f38180cb3ebc094f6955"
boot_command      = [
    "<enter><wait10><wait10><wait10><wait10>",
    "/usr/bin/curl -O http://{{ .HTTPIP }}:{{ .HTTPPort }}/enable_ssh.sh<enter><wait5>",
    "/usr/bin/sh enable_ssh.sh<enter>"
]
