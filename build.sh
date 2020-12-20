#!/usr/bin/env bash
set -ex

docker pull centos:7
docker build -t systemd base/
docker build -t desktop desktop/
docker build -t docker-desktop docker-desktop/
