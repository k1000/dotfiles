#!/bin/bash
# Usage 
# $ youtube2mp3.sh "http://youtube.com/get_video?video_id=c6f52hGpdWo&t=vjVQa1PpcFNaIOPgE1bJVU-ni2_0HoYTf7aHotV7MqI=" "output_base"
# will write it to ~/mp3/output_base.mp3
# The url is the url pointing to the flash version

TMPDIR="$HOME"
BASENAME=$2
mkdir "$TMPDIR/mp3" 2> /dev/null
# download
echo "Downloading video"
wget -O "/tmp/$BASENAME.flv" $1

# extract
echo "Extracting audio"
cd "$TMPDIR/mp3"
#ffmpeg -i "/tmp/$BASENAME.flv" -y -f mp3 -vn -acodec copy "/tmp/$BASENAME.mp3" 2> /dev/null
ffmpeg -i "/tmp/$BASENAME.flv" -y -f mp3 -vn -acodec copy "$TMPDIR/mp3/$BASENAME.mp3"

# convert
#echo "Converting to stereo sound"
#ecasound -i "/tmp/$BASENAME.mp3" -C -q -etf:8 -o "$TMPDIR/mp3/$BASENAME.mp3"

# finishing
echo "File written at $TMPDIR/mp3/$BASENAME.mp3"
rm -f "/tmp/$BASENAME.mp3"
rm -f "/tmp/$BASENAME.flv"
exit 0
