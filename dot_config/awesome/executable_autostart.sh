#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

wmname LG3D

#run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

#run xrandr --dpi 96
#run xrandr --auto
#run xrandr --auto && xrandr --output eDP1 && xrandr --output DP-1-4 --primary --right-of eDP1

#run xrandr --output eDP-1-1 --primary --mode 1920x1080 --pos 0x2160 --rotate normal --output DP-4 --mode 3840x2160 --pos 1920x0 --rotate normal
#run xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x2160 --rotate normal --output DP-1-4 --mode 3840x2160 --pos 1920x0 --rotate normal

#run volumeicon
# run xfce4-power-manager
# run xscreensaver -no-splash
# run fcitx5  # was in use
# run nm-applet  # was in use
# run blueman-applet  # was in use
# run optimus-manager-qt  # was in use
#run caffeine
#run pamac-tray
#run variety
#run blueberry-tray
#run tutanota-desktop
# run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  # was in use
# run xdman -m  # was in use
# run dropbox  # was in use
#run nitrogen --restore
#run conky -c $HOME/.config/awesome/system-overview
#you can set wallpapers in themes as well
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#run applications from startup
#run firefox
#run atom
#run insync start
#run spotify
#run ckb-next -b
#run discord --start-minimized
#run telegram-desktop
# run evolution  # was in use
# run kdeconnect-indicator  # was in use

# run pgrep -x sxhkd > /dev/null
run pkill -USR1 -x sxhkd
run sxhkd
# run easyeffects
# run mullvad-vpn
#xautolock -time 10 -locker 'i3lock -e -c 007f7f'

