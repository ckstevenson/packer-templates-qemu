#!/usr/bin/env sh

PASSWORD=$(/usr/bin/openssl passwd -crypt 'changeme')

systemctl start systemd-resolved
timedatectl set-ntp true
fdisk /dev/vda <<EOF
n



+512M
a
n




w
EOF
mkfs.ext4 /dev/vda2
mkfs.ext4 /dev/vda1
mount /dev/vda2 /mnt
mkdir /mnt/boot
mount /dev/vda1 /mnt/boot
yes | pacstrap /mnt base base-devel linux linux-firmware man bash-completion vim qemu-guest-agent grub openssh btrfs-progs
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash -c "grub-install /dev/vda"
arch-chroot /mnt /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"
#mv /mnt/boot/grub/grub.cfg.new /mnt/boot/grub/grub.cfg
arch-chroot /mnt /bin/bash -c "ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime"
arch-chroot /mnt /bin/bash -c "hwclock --systohc"
arch-chroot /mnt /bin/bash -c "echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen"
arch-chroot /mnt /bin/bash -c "locale-gen"
arch-chroot /mnt /bin/bash -c "echo 'LANG=en_US.UTF-8' > /etc/locale.conf"
arch-chroot /mnt /bin/bash -c "echo 'archvm' > /etc/hostname"
arch-chroot /mnt /bin/bash -c "echo '127.0.0.1   localhost' >>/etc/hosts"
arch-chroot /mnt /bin/bash -c "echo '::1     localhost' >>/etc/hosts"
arch-chroot /mnt /bin/bash -c "echo '127.0.1.1   archvm.localdomain archvm' >>/etc/hosts"
#arch-chroot /mnt "mkinitcpio -P"
#arch-chroot /mnt /bin/bash -c "echo -e 'changeme\nchangeme' | passwd root"
arch-chroot /mnt /bin/bash -c "/usr/bin/usermod --password ${PASSWORD} root"
arch-chroot /mnt /bin/bash -c "/usr/bin/useradd --password ${PASSWORD} --comment 'User' --create-home --user-group user"
echo 'user ALL=(ALL) ALL' >> /mnt/etc/sudoers.d/10_user
