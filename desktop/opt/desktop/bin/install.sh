#!/bin/bash
set -ex

# Install XRDP
yum -y install epel-release
yum -y install xrdp tigervnc-server
systemctl enable xrdp.service

# Allow users to login
systemctl enable systemd-user-sessions

# Install Docker
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker

# Disable Kernel specific servies
systemctl disable firewalld rtkit-daemon postfix network ksm kdump auditd abrt-oops ksmtuned abrt-ccpp

systemctl mask ksm rtkit-daemon ksmtuned abrt-ccpp

# Disable and mask plymouth-halt service because of shutdown hang.
# This is a stupid hack to stop the systemd-shutdown from running so that the container can shutdown.
systemctl disable plymouth-halt
systemctl mask plymouth-halt
cp /bin/echo /usr/lib/systemd/systemd-shutdown
