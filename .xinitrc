#!/bin/sh

# change lockscreen wallpaper automatically
nohup bash ~/scripts/lockscreen.sh 2> nohup.err < /dev/null &

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# trackpad for x220 velocity
#xinput --set-prop 11 'libinput Accel Speed' 0.2
#xinput --set-prop 15 'libinput Accel Speed' 0.7


xset r rate 200 50
exec i3
