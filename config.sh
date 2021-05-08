#!/bin/sh

printf "Speed up dnf\n"
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

printf "Removing networkmanager online service\n"
sudo systemctl disable NetworkManager-wait-online.service

printf "Removing packages\n"
sudo dnf -y remove rhythmbox gnome-maps gnome-contacts nano fedora-chromium-config gnome-weather abrt virtualbox-guest-additions gnome-software totem gnome-tour cheese PackageKit fedora-bookmarks

printf "Enabling rpm fusion\n"
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

printf "Enabling flathub\n"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

printf "Updating repo\n"
sudo dnf -y update

printf "Installing packages\n"
sudo dnf -y install ffmpeg gimp cmatrix cava lm_sensors acpi vim youtube-dl gcc make g++ chromium-freeworld telegram-desktop neofetch transmission mpv htop tuned

printf "Config files\n"
cp -r ~/dots/.vimrc ~/

echo "shopt -s autocd" | tee -a ~/.bashrc

printf "Gnome settings\n"
rm -rf ~/.config/dconf
cp -r ~/dots/dconf ~/.config

printf "Done!\n\n"
