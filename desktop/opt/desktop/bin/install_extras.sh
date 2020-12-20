#!/bin/bash
set -ex

install -m 0644 /opt/desktop/lib/libnss-json/libnss_json.so.2 /lib64
/sbin/ldconfig -n /lib /usr/lib

cat >/etc/nss-json.conf <<EOF
# The only mandatory parameter
url = https://raw.githubusercontent.com/Aklakan/libnss-json/master/yoda.json

# Enable debug output, such as that of the curl library.
# Default: false
verbose = false

# Use false for serving a static JSON document. Use true for url requests to include a POST argument of the form request=<the request as json>
# Default: false
includeRequestArg = false
EOF

cat >/etc/nsswitch.conf <<EOF
passwd:     json files sss
shadow:     files sss
group:      json files sss
hosts:      files dns myhostname
bootparams: nisplus [NOTFOUND=return] files
ethers:     files
netmasks:   files
networks:   files
protocols:  files
rpc:        files
services:   files sss
netgroup:   nisplus sss
publickey:  nisplus
automount:  files nisplus sss
aliases:    files nisplus
EOF
