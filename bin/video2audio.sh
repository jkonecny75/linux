#!/bin/sh

for FILE in "$@"; do
  target=$(basename "$FILE")
  target=${FILE%.*}.mp3
  echo "Converting \"$FILE\" to \"$target\" ... "
  ffmpeg -i "$FILE" -aq 2 "$target"
done

exit 0
ffmpeg -i filename.mp4 filename.mp3
ffmpeg -i video.mp4 -b:a 192K -vn music.mp3
ffmpeg -i k.mp4 -q:a 0 -map a k.mp3
ffmpeg -i k.mp4 -aq 0 -map a k.mp3
mplayer -ao pcm:fast:file=audio.wav -vo null -vc null video.avi
lame -V0 -q0 --vbr-new audio.wav audio.mp3
