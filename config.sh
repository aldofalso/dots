#!/bin/sh

#speed up dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

#remove packages 
sudo dnf remove rhythmbox gnome-maps gnome-contacts cheese firefox nano 

#dnf update
sudo dnf update

#install packages
sudo dnf install zsh gnome-tweaks ffmpeg gimp cmatrix lm_sensors neofetch neovim youtube-dl python3-speedtest-cli android-tools chromium-freeworld fira-code-fonts nodejs
 
#dots
cp -r ~/dots/nvim ~/.config
cp -r ~/dots/.zshrc ~/

#zsh stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt

mv ~/dots/zsh-syntax-highlighting ~/.config
mv ~/dots/zsh-autosuggestions ~/.config
mv ~/dots/spaceship-prompt ~/.config

#change shell to zsh
usermod --shell /bin/zsh "$USER"

echo done
