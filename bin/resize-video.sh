#!/bin/sh

# Purpose: Pro zmenseni velikosti videa z fotaku (prevod do kodeku X264)

FILE_NAME=$1

while [ "x$FILE_NAME" != "x" ]; do
  TMP_FILE="$FILE_NAME"-smaller.mp4

# Konverze
#  TMP_FILE="/tmp/$FILE_NAME" 
#  avidemux2_gtk --load "$FILE_NAME" --video-codec X264 --output-format AVI --save "$TMP_FILE" --quit
#  avidemux2_cli --nogui --load "$FILE_NAME" --video-codec Xvid4 --audio-codec AC3 --output-format AVI --save "$TMP_FILE" --quit
#  ffmpeg -i "$FILE_NAME" -c:v libx264 -pix_fmt yuv420p -movflags faststart -strict -2                  "$TMP_FILE"
#
# PC version
#  ffmpeg -i "$FILE_NAME" -c:v libx264 -pix_fmt yuv420p -movflags faststart -strict -2 -vf scale=800:-1 "$TMP_FILE"
# Mobile version  
  ffmpeg -i "$FILE_NAME" -c:v libx264                                      -strict -2 -vf scale=800:-1 "$TMP_FILE"

# Set datetime
  DATETIME=$(stat "${FILE_NAME}" | awk -F ": " 'FNR==6 {print $2}')
  touch -d "$DATETIME" "$TMP_FILE"

#  mv "$TMP_FILE" "${FILE_NAME}-smaller.mp4"

  shift
  FILE_NAME=$1
done;

exit 0

TODO - pomoci ffmpeg
ffmpeg -i fileA.AVI -c:v libx264 -pix_fmt yuv420p -movflags faststart -strict -2 fileB.mp4
status fileA
touch -d "2016-01-13 20:17:56.000000000" fileB.mp4
