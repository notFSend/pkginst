#!/bin/bash

# Check the Linux distribution
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    DISTRO="$ID"
else
    echo "Error: Unable to determine the Linux distribution."
    exit 1
fi

# Install packages based on the distribution
case "$DISTRO" in
    "ubuntu" | "debian")
        sudo apt update
        sudo apt install -y discord flatpak gimp libreoffice 1password brave-browser google-chrome-stable steam spotify blender kdenlive obs-studio code cura prusaslicer etcher kdeconnect git
        ;;
    "fedora")
        sudo dnf install -y discord flatpak gimp libreoffice 1password brave-browser google-chrome steam spotify blender kdenlive obs-studio code cura prusaslicer etcher kde-connect git
        ;;
    "arch" | "manjaro")
        sudo pacman -Syu --noconfirm git && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && yay -Syu discord flatpak gimp libreoffice 1password brave google-chrome steam spotify blender kdenlive obs-studio code cura prusaslicer etcher kdeconnect
        ;;
   "vanillaos")
	sudo apx install -y discord flatpak gimp libreoffice 1password brave google-chrome steam spotify blender kdenlive obs-studio code cura prusaslicer etcher kdeconnect git
	;;
    *)
        echo "Error: Unsupported Linux distribution."
        exit 1
        ;;
esac
echo "All specified packages have been installed successfully!"
