#!/bin/sh

#set -x

# Purpose: Pro zmenseni velikosti videa z fotaku (prevod do kodeku X264)

FILE_NAME=$1

while [ "x$FILE_NAME" != "x" ]; do
#   TMP_FILE=/mnt/nas/tmp/verca_convert/mobil_verca_fotky/Camera/"$FILE_NAME"
  TMP_FILE=/mnt/nas/tmp/verca_convert/mobil_verca_sdcard/DCIM/Camera/mobil/"$FILE_NAME"
#  TMP_FILE="$FILE_NAME"-smaller.mp4

  echo ">>> $FILE_NAME <<<"

# Check resolution
  video_width=$(ffmpeg -i "$FILE_NAME" -hide_banner 2>&1 | grep Video: | grep -Po '\d{3,5}x\d{3,5}' | cut -d'x' -f1)
  if [ -z "$video_width" ] || [ $video_width -le 800 ]; then
    shift
    FILE_NAME=$1
    continue
  fi

# Konverze
#  TMP_FILE="/tmp/$FILE_NAME" 
#  avidemux2_gtk --load "$FILE_NAME" --video-codec X264 --output-format AVI --save "$TMP_FILE" --quit
#  avidemux2_cli --nogui --load "$FILE_NAME" --video-codec Xvid4 --audio-codec AC3 --output-format AVI --save "$TMP_FILE" --quit
#  ffmpeg -i "$FILE_NAME" -c:v libx264 -pix_fmt yuv420p -movflags faststart -strict -2                  "$TMP_FILE"
#
# Kubik-player version
#  ffmpeg -i "$FILE_NAME" -c:v mpeg4 -q:v 2 -b:v 1M -maxrate 1M -bufsize 2M -vtag XVID                  "$TMP_FILE" -hide_banner
#
# 16:9
# mencoder "$FILE_NAME" \
#   -oac mp3lame -lameopts vbr=3 \
#   -ovc xvid -xvidencopts max_key_interval=25:bitrate=1200:vhq=2:bvhq=1:trellis:hq_ac:chroma_me:chroma_opt:quant_type=mpeg:aspect=16/9:threads=6 \
#   -vf scale=720:405 \
#   -o "TMP_FILE"
#
# 5:4
# mencoder "$FILE_NAME" \
#   -oac mp3lame -lameopts vbr=3 \
#   -ovc xvid -xvidencopts max_key_interval=25:bitrate=1200:vhq=2:bvhq=1:trellis:hq_ac:chroma_me:chroma_opt:quant_type=mpeg:aspect=5/4:threads=6 \
#   -vf scale=720:576,harddup \
#   -o "TMP_FILE"
#
#
# PC version
#  ffmpeg -i "$FILE_NAME" -c:v libx264 -pix_fmt yuv420p -movflags faststart -strict -2 -vf scale=800:-2 "$TMP_FILE" -hide_banner
# Mobile version  
  ffmpeg -i "$FILE_NAME" -c:v libx264                                      -strict -2 -vf scale=800:-2 "$TMP_FILE" -hide_banner

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
