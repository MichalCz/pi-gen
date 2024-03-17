#!/bin/bash -e

install -v -o 1000 -g 1000 -d -m 755 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/bin"
install -v -o 1000 -g 1000 -m 755 files/kiosk "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/bin"

install -v -o 1000 -g 1000 -d -m 755 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/kiosk"
install -v -o 1000 -g 1000 -m 755 files/init.html "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/kiosk"

patch -tsNp1 -r - --no-backup-if-mismatch "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.profile" files/profile.patch

on_chroot << EOF
    chown ${FIRST_USER_NAME}:${FIRST_USER_NAME} /home/${FIRST_USER_NAME}/.profile
EOF
