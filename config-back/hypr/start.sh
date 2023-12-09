#!/usr/bin/env bash

# Initializing wallpaper daemon
swww init &
swww img ~/Wallpapers/wp_anime_coffee_car.jpg &

# Initializes applet [neets pkgs.networkmanagerapplet]
nm-applet --indicator &

# Initializes notification
dunst &
