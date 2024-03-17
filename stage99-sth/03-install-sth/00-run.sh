#!/bin/bash -e

on_chroot << EOF
    which scramjet-transform-hub || (
        npm i -g @scramjet/sth
        pip install pyee==9.0.4 scramjet-framework-py --break-system-packages
    )
EOF
