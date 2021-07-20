os_family = "debian"
os_version = "10"
iso_url = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.10.0-amd64-netinst.iso"
iso_checksum = "53212fbaeac9533fdb274559ebac7519dd2d327b"
boot_command = ["<esc><wait>",
                "auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
                "<enter><wait>"
]
