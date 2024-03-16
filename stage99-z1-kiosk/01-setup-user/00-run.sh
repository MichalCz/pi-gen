#!/bin/bash -e

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_behaviour B2
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_overscan 1
EOF
