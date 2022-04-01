#!/bin/bash
# Copyright (C) 2022  cidy02
# This script is free software, under the terms of the GNU General Public Liscence, v3.0
# You should have recieved a copy of this liscence alongside this script
# If not, a copy can be found at https://www.gnu.org/licenses/gpl-3.0.en.html

# ADD CHAOTIC-AUR
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo "[chaotic-aur]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

# Update system and install needed packages
sudo pacman -Syu
sudo pacman -S --needed --noconfirm - < pkglist.txt

# Install yay from the AUR
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
# NOTE TO SELF, CHECK PACKAGE THAT GENERATES AND CHANGE THIS ACCORDINGLY
#sudo pacman -U *.zst

sudo mv 20-amdgpu.conf /etc/X11/xorg.conf.d/
mv .config/fish/ ~/.config/
sudo mv 20-amdgpu.conf /etc/X11/xorg.conf.d/
mv .config/fish/ ~/.config/

# XFCE PANELS CONFIG NEEDS TO BE MOVED TO THE RIGHT PLACE
cp xfce/docklike-23.rc ~/.config/xfce4/panel/
cp xfce/wickbuttons-15.rc ~/.config/xfce4/panel/
cp xfce/whiskermenu-7.rc ~/.config/xfce4/panel/

#Add wallpapers
WALLPAPERS_FOLDER=~/.local/share/
if [ ! -f "$FILE" ]; then
    mkdir -p ~/.local/share/wallpapers
fi
cp wallpapers/ ~/.local/share/wallpapers

