#!/bin/bash

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=${SCRIPT_PATH%/*}
SCRIPT_NAME=${SCRIPT_PATH##*/}

TARGET_DIR=$1
shift

DELETE=$1
shift

if [ -z $TARGET_DIR ]; then
  echo "usage: $SCRIPT_NAME <target dir> [-d] [other params to rsync]"
  exit 1
fi

if [ ! -d "${TARGET_DIR}" ]; then
  echo "directory ${TARGET_DIR} does not exist"
  exit 1
fi

if [ "$DELETE" = "-d" ]; then
  DELETE='--delete'
else
  DELETE=''
fi

rsync $DELETE -ahv --modify-window 1 --no-perms --no-owner --no-group $@ . $TARGET_DIR
