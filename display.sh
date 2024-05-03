#!/bin/sh

# ---------- System Installation ----------

# system update
sudo pacman -Syu

# yay installation
cd ~/Github && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
yay -Y --gendb


# ----- Audio and Display

# audio
sudo pacman -S --noconfirm pipewire-pulse alsa-utils pavucontrol

# display server 
sudo pacman -S --noconfirm base-devel xorg xorg-xinit xorg-xinput

# GPU driver
sudo pacman -S --noconfirm nvidia nvidia-settings

# compositor
sudo pacman -S --noconfirm picom 

# window manager + switcher
sudo pacman -S --noconfirm rofi
yay -S --noconfirm qtile-git qtile-extras-git


# ----- Configuration

# .files
cp ~/Github/arch/home/.bashrc ~/.bashrc
cp ~/Github/arch/home/.bash_profile ~/.bash_profile
cp ~/Github/arch/home/.xinitrc ~/.xinitrc

# qtile and picom
cp ~/Github/arch/home/config/picom/picom.conf ~/.config/picom/picom.conf
cp ~/Github/arch/home/config/qtile/autostart.sh ~/.config/qtile/autostart.sh
cp ~/Github/arch/home/config/qtile/config.py ~/.config/qtile/config.py
chmod +x ~/.config/qtile/autostart.sh
python -m py_compile ~/.config/qtile/config.py

# setting up the wallpaper
cp -r ~/Github/arch/Pictures ~/Pictures
nitrogen ~/Pictures/ --random --set-scaled --save
nitrogen --restore

# creating xorg.conf and start X11
sudo nvidia-xconfig
startx