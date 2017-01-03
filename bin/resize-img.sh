#!/bin/sh

# Test if commands exit
type > /dev/null identify && type > /dev/null convert

if [ $? != 0 ]; then
  echo "Install imagemagic !"
  exit 1
fi

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=${SCRIPT_PATH%/*}
SCRIPT_NAME=${SCRIPT_PATH##*/}

FILE="$1"
FILE_PATH="$(realpath "$FILE")"
WIDTH_NEW=800

if [ -z "$FILE" ]; then
  echo "Usage: SCRIPT_NAME {file}"
  exit 1
fi

RESOLUTION_ORIG=$(identify -format '%wx%h' "$FILE_PATH")
WIDTH_ORIG=$(echo $RESOLUTION_ORIG | awk -F x '{print $1}')
HEIGHT_ORIG=$(echo $RESOLUTION_ORIG | awk -F x '{print $2}')

if (( $WIDTH_ORIG > $WIDTH_NEW )); then
  SCALE=$(echo "$WIDTH_ORIG/$WIDTH_NEW" | bc -l)
  #SCALE=$(($WIDTH_ORIG / $WIDTH_NEW))
  HEIGHT_NEW=$(echo "$HEIGHT_ORIG/$SCALE" | bc -l)
  HEIGHT_NEW=$(echo $HEIGHT_NEW/1 | bc)
  #HEIGHT_NEW=$(($HEIGHT_ORIG/$SCALE))

  FILE_DIR=${FILE_PATH%/*}
  FILE_NAME=${FILE_PATH##*/}
  FILE_SUFF=${FILE_NAME##*.}
  FILE_SHORT_NAME=${FILE_NAME%%.*}
  convert "$FILE_PATH" -resize ${WIDTH_NEW}x${HEIGHT_NEW} "${FILE_DIR}/${FILE_SHORT_NAME}_small.${FILE_SUFF}"
fi
