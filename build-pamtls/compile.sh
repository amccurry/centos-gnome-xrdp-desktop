#!/bin/bash
set -ex
export PATH=$PATH:/usr/local/go/bin
git clone https://github.com/twitchyliquid64/pamtls.git
cd pamtls
export GOPATH=$(pwd)
./build.sh clean_build
cp pamtls.so /output
