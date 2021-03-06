#!/bin/bash

# Install polybar
yes | sudo pacman -S polybar
# Install rofi
yes | sudo pacman -S rofi
# Install picom with rounded corners and blur
yes | yay -S picom-ibhagwan-git
# Install unclutter
yes | sudo pacman -S unclutter
# Install redshift
yes | sudo pacman -S redshift
# Install pywal
yes | sudo pacman -S python-pywal
# Install fonts
#yes | yay -S ttf-symbola
yes | yay -S ttf-font-awesome
yes | yay -S ttf-roboto
yes | yay -S ttf-nerd-fonts-symbols

# Download dotfiles
cd ~ && git clone https://github.com/mrsorensen/dotfiles.git
# Overwrite i3 config
cp ~/dotfiles/i3/config ~/.i3/config
# Overwrite polybar config
mkdir ~/.config/polybar && cp ~/dotfiles/polybar/config ~/.config/polybar/config
# Overwrite picom config
cp ~/dotfiles/picom/picom.conf ~/.config/picom.conf
# Overwrite rofi config
mkdir .config/rofi
echo '@import "~/.cache/wal/colors-rofi-dark"' >> .config/rofi/config.rasi
# Overwrite .Xresources
cp ~/dotfiles/Xresources/.Xresources ~/.Xresources

# Download wallpaper
wget --output-document=~/Pictures/wallpaper.jpg http://files.vividscreen.info/soft/c7592bed743b7b7668f17e1bd7fa90f0/Gta-San-Andreas-1920x1080.jpg
wal -a 80 -i ~/Pictures/wallpaper.jpg

# Remove dotfiles folder
#rm -rf ~/dotfiles

# Reboot
reboot
