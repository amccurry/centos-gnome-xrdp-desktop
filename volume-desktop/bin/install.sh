#!/bin/bash
set -e
set -x

CHROOT_INSTALL_DIR=/docker_volume_root

if [ -f ${CHROOT_INSTALL_DIR}/.setup ] ; then
  exit 0
fi
cp /install_chrooted.sh ${CHROOT_INSTALL_DIR}
cd ${CHROOT_INSTALL_DIR}
tar -xvf /centos-7-docker.tar.xz

mount -o bind /dev ${CHROOT_INSTALL_DIR}/dev
mount -o bind /proc ${CHROOT_INSTALL_DIR}/proc
mount -o bind /sys ${CHROOT_INSTALL_DIR}/sys
mount -o bind /etc/resolv.conf ${CHROOT_INSTALL_DIR}/etc/resolv.conf
mount -o bind /etc/hosts ${CHROOT_INSTALL_DIR}/etc/hosts
mount -o bind /etc/hostname ${CHROOT_INSTALL_DIR}/etc/hostname
chmod 666 /dev/pts/ptmx

chroot ${CHROOT_INSTALL_DIR} /install_chrooted.sh
touch ${CHROOT_INSTALL_DIR}/.setup
