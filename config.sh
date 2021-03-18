#!/bin/sh

# speed up dnf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

# improve boot time
sudo systemctl disable NetworkManager-wait-online.service

# remove packages 
sudo dnf -y remove nano fedora-chromium-config abrt virtualbox-guest-additions azote

# add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# add rpm repo
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# dnf update
sudo dnf -y update

# install packages
sudo dnf -y install ffmpeg gimp cmatrix cava lm_sensors vim youtube-dl python3-speedtest-cli gcc kernel-devel make g++ chromium-freeworld telegram-desktop neofetch transmission vlc htop gvfs gvfs-mtp simple-mtpfs kitty xss-lock xfce4-power-manager file-roller gamemode libreoffice-writer libreoffice-impress gnome-boxes redshift git 

# dots
cp -r ~/dots/.vimrc ~/
cp -r ~/dots/.bashrc ~/
sudo cp ~/dots/scripts/* /usr/local/bin

# if laptop set hostname
if [ -d /sys/class/power_supply/BAT0* ]; then
  hostnamectl set-hostname thinkpad &&

  sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF

fi

echo done
