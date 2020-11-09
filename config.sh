#!/bin/sh

#speed up dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

#improve boot time
sudo systemctl disable NetworkManager-wait-online.service

#remove packages 
sudo dnf -y remove rhythmbox gnome-maps gnome-contacts cheese nano firefox 

#add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#add rpm repo
sudo dnf -f install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#dnf update
sudo dnf -y update

#install packages
sudo dnf -y install zsh gnome-tweaks ffmpeg gimp cmatrix lm_sensors vim youtube-dl python3-speedtest-cli gcc kernel-devel make g++ chromium-browser-privacy telegram-desktop

#dots
cp -r ~/dots/.vimrc ~/
cp -r ~/dots/.zshrc ~/
cp -r ~/dots/.fonts ~/
sudo cp ~/dots/scripts/* /usr/local/bin

#zsh stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt

mv ~/dots/zsh-syntax-highlighting ~/.config
mv ~/dots/zsh-autosuggestions ~/.config
mv ~/dots/spaceship-prompt ~/.config

#change shell to zsh
sudo usermod --shell /bin/zsh "$USER"

echo done
