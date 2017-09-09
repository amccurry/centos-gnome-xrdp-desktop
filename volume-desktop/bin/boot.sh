#!/bin/bash
/install.sh
mount -o bind /dev /docker_volume_root/dev
mount -o bind,ptmxmode=0666 /dev/pts /docker_volume_root/dev/pts
mount -o bind /proc /docker_volume_root/proc
mount -o bind /sys /docker_volume_root/sys
mount -o bind /etc/resolv.conf /docker_volume_root/etc/resolv.conf
mount -o bind /etc/hosts /docker_volume_root/etc/hosts
mount -o bind /etc/hostname /docker_volume_root/etc/hostname
cp /boot_chrooted.sh /docker_volume_root
exec -a init chroot /docker_volume_root /boot_chrooted.sh
