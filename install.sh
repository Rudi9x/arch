#!/bin/sh

# Installing packages
pacman -S qtile alacritty picom nitrogen neofetch gnome-themes-extra nvidia-settings thunar maim feh p7zip nerd-fonts starship keepassxc discord pulseaudio

# Copying the config files
cp .bashrc ~/.bashrc && cp .bash_profile ~/.bash_profile
cp .gtkrc-2.0 ~/.gtkrc-2.0
cp .xinitrc ~/.xinitrc
mkdir -p ~/.config/alacritty && mkdir -p ~/.config/gtk-3.0 && mkdir -p ~/.config/picom && mkdir -p ~/.config/qtile
cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp .config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp .config/picom/picom.conf ~/.config/picom/picom.conf
cp .config/qtile/config.py ~/.config/qtile/config.py && cp .config/qtile/autostart.sh ~/.config/qtile/autostart.sh
chmod +x ~/.config/qtile/autostart.sh

# Setting up the wallpaper
cp .images/* ~/Pictures
nitrogen ~/Pictures && nitrogen --restore

# Compiling the qtile config
python -m py_compile ~/.config/qtile/config.py
