#!/bin/bash

# cleaning previous image
rm -rf ~/.cache/i3lock

# choosing image
image=~/.betterlockscreen/$(shuf -i 127-20654 -n 1).jpg
while [ ! -f "$image" ]
do
    image=~/.betterlockscreen/$(shuf -i 127-20654 -n 1).jpg
done

# change the lockscreen wallpaper
betterlockscreen -u $image

