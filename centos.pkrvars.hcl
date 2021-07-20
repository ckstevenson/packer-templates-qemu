os_family = "centos"
os_version = "stream8"
iso_url = "https://centos.mirror.iphh.net/CentOS/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-20210716-dvd1.iso"
iso_checksum = "12f7e1ed379ebf8b9684a17e04a5dcf2c3a641521d285e278150a9964060498a"
boot_command = ["<tab>",
                " text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg",
                "<enter><wait>"
]
