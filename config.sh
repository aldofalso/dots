#!/bin/sh

# speed up dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

# improve boot time
sudo systemctl disable NetworkManager-wait-online.service

# remove packages 
sudo dnf -y remove rhythmbox gnome-maps gnome-contacts nano fedora-chromium-config gnome-weather abrt virtualbox-guest-additions gnome-software totem

# add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# add rpmfusion repo
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# dnf update
sudo dnf -y update

# install packages
sudo dnf -y install ffmpeg gimp cmatrix cava lm_sensors acpi vim youtube-dl python3-speedtest-cli gcc kernel-devel make g++ chromium-freeworld telegram-desktop neofetch transmission mpv eclipse 

# dots
cp -r ~/dots/.vimrc ~/
echo "shopt -s autocd" | tee -a ~/.bashrc

# gnome settings
rm -rf ~/.config/dconf
cp -r ~/dots/dconf ~/.config

echo done
