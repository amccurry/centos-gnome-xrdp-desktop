#!/bin/bash
set -e
set -x

(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

yum -y update
yum -y groupinstall "GNOME Desktop"
yum -y install epel-release
yum -y install xrdp tigervnc-server

# Disable and mask this service because of shutdown hang.
systemctl disable plymouth-halt
systemctl mask plymouth-halt

# This is a stupid hack to stop the systemd-shutdown from running so that the container can shutdown.
cp /bin/echo /usr/lib/systemd/systemd-shutdown

systemctl enable xrdp.service
useradd red && echo red | passwd red --stdin
