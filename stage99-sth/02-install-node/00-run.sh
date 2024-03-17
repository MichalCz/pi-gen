#!/bin/bash -e

NODE_VERSION=18

echo "Configure nodesource for version v$NODE_VERSION.x"

on_chroot << EOF
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -
EOF
