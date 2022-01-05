os_family = "debian"
os_version = "10"
iso_url = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.2.0-amd64-netinst.iso"
iso_checksum = "c685b85cf9f248633ba3cd2b9f9e781fa03225587e0c332aef2063f6877a1f0622f56d44cf0690087b0ca36883147ecb5593e3da6f965968402cdbdf12f6dd74"
boot_command = ["<esc><wait>",
                "auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
                "<enter><wait>"
]
