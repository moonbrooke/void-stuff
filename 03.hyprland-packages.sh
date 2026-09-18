#!/usr/bin/env bash

set -euo pipefail

PACKAGES=(
    # Desktop Environment
    hyprland awww dunst grim slurp jq Waybar rofi hyprpicker imv wl-clipboard cliphist hyprpolkitagent rofimoji xdg-desktop-portal-hyprland nwg-look
    
    # Utilities
    alsa-utils udiskie Thunar thunar-volman gvfs unzip stow fcitx5 fcitx5-mozc fcitx5-configtool
    
    # Terminal & stuff
    foot neovim zsh fastfetch fzf bat btop git base-devel ripgrep
    
    # Fonts
    noto-fonts-ttf noto-fonts-emoji noto-fonts-cjk-sans
)

echo "=== Syncing repositories and installing Void Linux packages ==="
sudo xbps-install -Sy "${PACKAGES[@]}"

echo ""
echo "Installation completed successfully!"
