#!/bin/sh -e
FILE=/tmp/screen.png
scrot $FILE
mogrify -scale 10% -scale 1000% $FILE
i3lock -i $FILE
#sleep 60; pgrep i3lock && xset dpms force off