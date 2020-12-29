#!/bin/bash
set -ex
git clone https://github.com/Aklakan/libnss-json.git
cd libnss-json/libnss-json
make lib
cp target/libnss_json.so.2 /output
