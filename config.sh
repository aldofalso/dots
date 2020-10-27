#!/bin/sh

#speed up dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

#remove packages 
sudo dnf remove rhythmbox gnome-maps gnome-contacts cheese nano 

#dnf update
sudo dnf update

#install packages
sudo dnf install zsh gnome-tweaks ffmpeg gimp cmatrix lm_sensors neovim youtube-dl python3-speedtest-cli nodejs gcc kernel-devel make

#add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#dots
cp -r ~/dots/nvim ~/.config
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
