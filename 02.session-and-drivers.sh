#!/usr/bin/env bash

set -euo pipefail

echo "=== Updating repositories and installing packages ==="
sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -Sy dbus elogind polkit nvidia nvidia-libs-32bit mesa-dri-32bit intel-video-accel mesa-dri intel-ucode
sudo xbps-install -Sy pipewire wireplumber os-prober ntfs-3g

echo "=== Enabling Runit Services ==="
for service in dbus elogind polkitd; do
    if [ ! -L "/var/service/$service" ]; then
        sudo ln -s "/etc/sv/$service" /var/service/
        echo "Enabled service: $service"
    else
        echo "Service $service is already enabled."
    fi
done

echo ""
echo "Setup complete! Please reboot your system."
