#!/usr/bin/env bash

set -euo pipefail

CONF_DIR="/etc/pipewire/pipewire.conf.d"
SRC_WIREPLUMBER="/usr/share/examples/wireplumber/10-wireplumber.conf"
SRC_PULSE="/usr/share/examples/pipewire/20-pipewire-pulse.conf"

echo "=== Setting up PipeWire configuration ==="

sudo mkdir -p "$CONF_DIR"

# WirePlumber session manager configuration
if [ ! -L "$CONF_DIR/10-wireplumber.conf" ]; then
    sudo ln -s "$SRC_WIREPLUMBER" "$CONF_DIR/"
    echo "Linked 10-wireplumber.conf"
else
    echo "10-wireplumber.conf link already exists."
fi

# PipeWire PulseAudio interface configuration
if [ ! -L "$CONF_DIR/20-pipewire-pulse.conf" ]; then
    sudo ln -s "$SRC_PULSE" "$CONF_DIR/"
    echo "Linked 20-pipewire-pulse.conf"
else
    echo "20-pipewire-pulse.conf link already exists."
fi

echo ""
echo "Configuration complete!"
echo "Don't forget to add 'pipewire' to your startup/autostart configuration."
