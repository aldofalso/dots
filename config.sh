#!/bin/sh

# speed up dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

# improve boot time
sudo systemctl disable NetworkManager-wait-online.service

# remove packages 
sudo dnf -y remove rhythmbox gnome-maps gnome-contacts nano firefox fedora-chromium-config gnome-weather abrt virtualbox-guest-additions gnome-software totem

# add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# add rpm repo
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# add vscode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# dnf update
sudo dnf -y update

# install packages
sudo dnf -y install gnome-tweaks ffmpeg gimp cmatrix cava lm_sensors vim youtube-dl python3-speedtest-cli gcc kernel-devel make g++ chromium-browser-privacy chromium-freeworld telegram-desktop code neofetch transmission levien-inconsolata-fonts vlc

# dots
cp -r ~/dots/.vimrc ~/
cp -r ~/dots/.bashrc ~/
sudo cp ~/dots/scripts/* /usr/local/bin

# gnome settings
rm -rf ~/.config/dconf
cp -r ~/dots/dconf ~/.config

# if laptop set hostname
if [ -d /sys/class/power_supply/BAT0* ]; then
  hostnamectl set-hostname thinkpad
fi

echo done
