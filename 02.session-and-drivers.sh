#!/usr/bin/env bash

set -euo pipefail

echo "=== Updating repositories and installing packages ==="
sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -Sy dbus seatd polkit elogind nvidia nvidia-libs-32bit mesa-dri-32bit intel-video-accel mesa-dri intel-ucode
sudo xbps-install -Sy os-prober ntfs-3g

echo "=== Enabling Runit Services ==="
for service in dbus seatd polkitd; do
    if [ ! -L "/var/service/$service" ]; then
        sudo ln -s "/etc/sv/$service" /var/service/
        echo "Enabled service: $service"
    else
        echo "Service $service is already enabled."
    fi
done

echo "=== Adding $USER to the _seatd group ==="
sudo usermod -aG _seatd "$USER"

echo ""
echo "Setup complete! Please reboot your system."
