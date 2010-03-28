#!/bin/sh
# run a sopcast player and open it in vlc
$HOME/usr/share/sopcast/sp-sc-auth $1 3908 6908 >/dev/null
sleep 2
#vlc http://localhost:6908/tv.asf > /dev/null
totem http://localhost:6908/tv.asf > /dev/null