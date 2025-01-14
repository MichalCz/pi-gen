#!/bin/bash -e

IMG_FILE="${STAGE_WORK_DIR}/${IMG_FILENAME}${IMG_SUFFIX}.img"

IMGID="$(dd if="${IMG_FILE}" skip=440 bs=1 count=4 2>/dev/null | xxd -e | cut -f 2 -d' ')"

BOOT_PARTUUID="${IMGID}-01"
ROOT_PARTUUID="${IMGID}-04"
DEPLOY_PARTUUID="${IMGID}-02"
WORK_PARTUUID="${IMGID}-03"

sed -i "s/BOOTDEV/PARTUUID=${BOOT_PARTUUID}/" "${ROOTFS_DIR}/etc/fstab"
sed -i "s/ROOTDEV/PARTUUID=${ROOT_PARTUUID}/" "${ROOTFS_DIR}/etc/fstab"
sed -i "s/DEPLOYDEV/PARTUUID=${DEPLOY_PARTUUID}/" "${ROOTFS_DIR}/etc/fstab"
sed -i "s/WORKDEV/PARTUUID=${WORK_PARTUUID}/" "${ROOTFS_DIR}/etc/fstab"

sed -i "s/ROOTDEV/PARTUUID=${ROOT_PARTUUID}/" "${ROOTFS_DIR}/boot/firmware/cmdline.txt"
