#!/usr/bin/env bash
#                _ _
# __      ____ _| | |_ __   __ _ _ __   ___ _ __
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|
#                   |_|         |_|
#
# by Stephan Raabe (2023)
# -----------------------------------------------------

case $1 in

    # Load wallpaper from .cache of last session
    "init")
        if [ -f ~/.cache/current_wallpaper.jpg ]; then
            wal -q -i ~/.cache/current_wallpaper.jpg
        else
            wal -q -i ~/Wallpapers/
        fi
    ;;

    # Select wallpaper with rofi
    "select")
        selected=$(ls -1 ~/Wallpapers | grep "jpg" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-wallpaper.rasi)
        if [ ! "$selected" ]; then
            echo "No wallpaper selected"
            exit
        fi
        wal -q -i ~/Wallpapers/$selected
    ;;

    # Randomly select wallpaper
    *)
        wal -q -i ~/Wallpapers/
    ;;

esac

# -----------------------------------------------------
# Load current pywal color scheme
# -----------------------------------------------------
source "$HOME/.cache/wal/colors.sh"
echo "Wallpaper: $wallpaper"

# -----------------------------------------------------
# Copy selected wallpaper into .cache folder
# -----------------------------------------------------
cp $wallpaper ~/.cache/current_wallpaper.jpg

# -----------------------------------------------------
# get wallpaper iamge name
# -----------------------------------------------------
newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

# -----------------------------------------------------
# Reload waybar with new colors
# -----------------------------------------------------
~/dotfiles/scripts/waybar/launch.sh

# -----------------------------------------------------
# Set the new wallpaper
# -----------------------------------------------------
transition_type="wipe"
# transition_type="outer"
# transition_type="random"

wpaperd
# -----------------------------------------------------
# Send notification
# -----------------------------------------------------
sleep 1
notify-send "Colors and Wallpaper updated" "with image $newwall"

echo "DONE!"
