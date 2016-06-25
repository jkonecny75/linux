#!/bin/sh

ext=${1:-[Jj][Pp][Gg]}
size=${2:-"800x600"}
dir=convert

if [ -z "$ext" ]; then
  echo Pouziti: `basename $0` {pripona} [rozliseni - implicitni 800x600]
  exit 1
fi

if [ ! -d $dir ]; then
  mkdir $dir;
fi

for i in `ls -1 *.$ext`; do
  echo $i
#  convert -resize $2 -rotate 90 $i $dir/$i;
#  convert -resize $2 $i $dir/$i;
  convert $i -resize $size $dir/$i;
done
