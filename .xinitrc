setxkbmap -layout gb,gb
stalonetray --icon-size=16 --kludges=force_icons_size &
SpiderOak &
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources
if (xrandr | grep "HDMI1 disconnected"); then
	xrandr --output LVDS1 --primary --mode 1366x768
else
	xrandr --output LVDS1 --mode 1366x768 --output HDMI1 --primary --mode 1920x1080 --above LVDS1
fi
feh --bg-fill ~/.bg.jpg
exec xmonad
