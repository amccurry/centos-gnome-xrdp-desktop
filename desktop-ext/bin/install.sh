#!/bin/bash
set -ex
cp /opt/desktop-ext/lib/libnss_json.so.2 /lib64/
cat >/etc/nss-json.conf <<EOF
url = http://$(echo $NSS_HOSTNAME):4567/nss
verbose = false
includeRequestArg = false
EOF
sed -i 's#passwd:     files sss#passwd:     json files sss#g' /etc/nsswitch.conf
sed -i 's#group:      files sss#group:      json files sss#g' /etc/nsswitch.conf
