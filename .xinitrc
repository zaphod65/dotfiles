export PATH=$PATH:/home/zaphod/.bin:/home/zaphod/.xmobin
setxkbmap -layout gb,gb
stalonetray --icon-size=16 --kludges=force_icons_size &
SpiderOak &
google-musicmanager &
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr &
xrdb -merge ~/.Xresources
xrandr --output HDMI1 --primary --mode 1920x1080 --output HDMI2 --mode 1440x900 --right-of HDMI1
feh --bg-fill ~/.bg.jpg
exec xmonad
