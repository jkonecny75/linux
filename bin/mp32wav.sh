#!/bin/sh

for i in *.mp3; do
  lame --decode -x "$i" "$i".wav
done
