#!/bin/bash

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=${SCRIPT_PATH%/*}
SCRIPT_NAME=${SCRIPT_PATH##*/}

SOURCE_DIR=$1
shift

TARGET_DIR=$1
shift

DELETE=$1
shift

if [ -z "$TARGET_DIR" ]; then
  echo "usage: $SCRIPT_NAME <source dir> <target dir> [-d] [other params to rsync]"
  exit 1
fi

if [ ! -d "${SOURCE_DIR}" ]; then
  echo "directory ${SOURCE_DIR} does not exist"
  exit 1
fi

if [ ! -d "${TARGET_DIR}" ]; then
  echo "directory ${TARGET_DIR} does not exist"
  exit 1
fi

if [ "$DELETE" = "-d" ]; then
  DELETE=''
else
  DELETE='-n'
fi

rsync $DELETE -rvh --delete-before --existing --ignore-existing --exclude '.sync' $@ "${SOURCE_DIR}/" "${TARGET_DIR}"
