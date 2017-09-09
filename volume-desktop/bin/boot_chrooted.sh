#!/bin/bash
chmod 666 /dev/pts/ptmx
exec /usr/sbin/init
