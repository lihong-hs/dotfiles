#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# run xrandr --dpi 96
# run xrandr --auto
# run xrandr --auto && xrandr --output eDP1 && xrandr --output DP-1-4 --primary --right-of eDP1
#run xrandr --auto && xrandr --output eDP1 --mode 1920x1080 --pos 0x100 --rotate normal --output DP-1-4 --primary --mode 3840x2160 --pos 1920x0 --rotate normal


# nvidia mode
run xrandr --auto && xrandr --output eDP-1-1 --off --output DP-4 --primary --mode 3840x2160 --rotate normal
# run xrandr --auto && xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0  --output DP-4 --primary --mode 3840x2160 --pos 1920x0 --rotate normal


#run xrandr --output eDP-1-1 --primary --mode 1920x1080 --pos 0x2160 --rotate normal --output DP-4 --mode 3840x2160 --pos 1920x0 --rotate normal
#run xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x2160 --rotate normal --output DP-1-4 --mode 3840x2160 --pos 1920x0 --rotate normal
