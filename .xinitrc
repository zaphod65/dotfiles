export PATH=$PATH:/home/zaphod/.bin:/home/zaphod/.xmobin
setxkbmap -layout gb,gb
stalonetray --icon-size=16 --kludges=force_icons_size &
SpiderOakONE &
google-musicmanager &
xscreensaver -no-splash &

# if HDMI1 is connected then set display mode appropriately
if [ -n "`xrandr | grep HDMI1 | grep connected | grep -v dis`" ]; then
    xrandr --output HDMI1 --mode 1920x1080 --primary --output eDP1 --mode 1920x1080 --right-of HDMI1
else
    xrandr --output eDP1 --primary --mode 1920x1080
fi

feh --bg-fill ~/.bg.jpg
xinput -disable "ELAN Touchscreen"
exec xmonad
