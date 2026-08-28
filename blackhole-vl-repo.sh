#!/usr/bin/env bash

set -e

sudo mkdir -p /etc/xbps.d

sudo cp /usr/share/xbps.d/00-repository-main.conf /etc/xbps.d/
sudo sed -i "1i repository=https://mirror.black-hole.dev/$(xbps-uhelper arch)" /etc/xbps.d/00-repository-main.conf

echo "Void Linux mirror repository updated successfully!"
