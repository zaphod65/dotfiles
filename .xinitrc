export PATH=$PATH:/home/zaphod/.bin:/home/zaphod/.xmobin
#synergys --config /etc/synergy.conf
setxkbmap -layout gb,gb
stalonetray --icon-size=16 --kludges=force_icons_size &
SpiderOakONE &
google-musicmanager &
xscreensaver -no-splash &
#xsetroot -cursor_name left_ptr &
#xrdb -merge ~/.Xresources
#xrandr --output HDMI1 --primary --mode 1920x1080 --output HDMI2 --mode 1440x900 --right-of HDMI1
# Assuming for now that I'll always have the external plugged in until I do the scripting properly here
# and write the scripts to change mode.
xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI1 --mode 1920x1080 --left-of eDP1
feh --bg-fill ~/.bg.jpg
xinput -disable "ELAN Touchscreen"
exec xmonad
