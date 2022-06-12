#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

sudo ln -s /usr/bin/rclone /sbin/mount.rclone

sudo mkdir -p /usr/local/lib/systemd/system
sudo install -v -o root -g root -m 644 $(dirname $0)/mnt-rclone.automount /usr/local/lib/systemd/system
sudo install -v -o root -g root -m 644 $(dirname $0)/mnt-rclone.mount /usr/local/lib/systemd/system

sudo systemctl enable mnt-rclone.automount
