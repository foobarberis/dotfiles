#!/bin/sh

# Set key repeat rate
xset r rate 220 60

# Set new resolutions
xrandr --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr --addmode Virtual-1 "1920x1200_60.00"
xrandr -s "1920x1200_60.00"

# xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync

xrdb $HOME/.Xresources

exec i3
