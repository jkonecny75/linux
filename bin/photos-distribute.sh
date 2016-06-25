#!/bin/sh

IFS="
"

function moveImg() {
  #i=$(echo $1 | tr " " "\ ")
  IMG_DATE=$(exifgrep DateTimeOriginal "$1" | cut -c 41-50 | tr ":" "-")
  if [ ! -d $IMG_DATE ]; then
    mkdir $IMG_DATE;
  fi;

  echo "Presun fotky $1 do $IMG_DATE"
  mv "$1" "$IMG_DATE"

}

function moveAvi() {
  AVI_DATE=$(stat -c "%y" $1 | cut -c 1-10)

  if [ ! -d $AVI_DATE ]; then
    mkdir $AVI_DATE;
  fi;

  echo "Presun videa $1 do $AVI_DATE"
  mv "$1" $AVI_DATE

}


#find . -name "*.jpg" -o -name "*.JPG" -print | xargs -i -t moveImg {}
# for i in `find . -name "*.jpg" -o -name "*.JPG" -print`; do
for i in `find . -type f -print`; do
  case `echo ${i/*./}` in
    JPG|jpg) moveImg $i ;;
    AVI|avi) moveAvi $i ;;
    THM) echo "Mazu THM soubor $i"; rm $i ;;
  esac
done

exit

############################
old version
############################

export IFS="
"
for i in `ls -1 *.jpg *.JPG`; do
  i=$(echo $i | tr " " "\ ")
  IMG_DATE=$(exifgrep DateTimeOriginal "$i" | cut -c 41-50 | tr ":" "-")
  if [ ! -d $IMG_DATE ]; then
    mkdir $IMG_DATE;
  fi;

  echo "Presun $i do $IMG_DATE"
  mv "$i" $IMG_DATE
done
