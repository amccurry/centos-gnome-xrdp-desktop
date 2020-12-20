#!/bin/bash
set -ex

# Install XRDP
yum -y install epel-release
yum -y install xrdp tigervnc-server
systemctl enable xrdp.service

# Install Docker
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker

# Disable Kernel specific servies
systemctl disable firewalld rtkit-daemon postfix network ksm kdump auditd abrt-oops ksmtuned

systemctl mask ksm rtkit-daemon ksmtuned

# Disable and mask plymouth-halt service because of shutdown hang.
# This is a stupid hack to stop the systemd-shutdown from running so that the container can shutdown.
systemctl disable plymouth-halt
systemctl mask plymouth-halt
cp /bin/echo /usr/lib/systemd/systemd-shutdown

useradd user && echo password | passwd user --stdin
usermod -a -G wheel user
usermod -a -G docker user
