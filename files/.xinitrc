# nohup bash ~/bin/lockscreen.sh 2>nohup.err </dev/null &

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# xset r rate 200 50
exec i3
