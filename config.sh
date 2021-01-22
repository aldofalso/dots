#!/bin/sh

# speed up dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

# improve boot time
sudo systemctl disable NetworkManager-wait-online.service

# remove packages 
sudo dnf -y remove rhythmbox gnome-maps gnome-contacts nano firefox fedora-chromium-config gnome-weather abrt virtualbox-guest-additions gnome-software

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
sudo dnf -y install zsh gnome-tweaks ffmpeg gimp cmatrix cava lm_sensors vim youtube-dl python3-speedtest-cli gcc kernel-devel make g++ chromium-browser-privacy chromium-freeworld telegram-desktop code neofetch transmission levien-inconsolata-fonts

# dots
cp -r ~/dots/.vimrc ~/
cp -r ~/dots/.zshrc ~/
sudo cp ~/dots/scripts/* /usr/local/bin

# zsh stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt

mv ~/dots/zsh-syntax-highlighting ~/.config
mv ~/dots/zsh-autosuggestions ~/.config
mv ~/dots/spaceship-prompt ~/.config

# gnome settings
rm -rf ~/.config/dconf
cp -r ~/dots/dconf ~/.config 

# change shell to zsh
sudo usermod --shell /bin/zsh "$USER"

echo done
