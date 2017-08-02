#!/bin/bash

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=${SCRIPT_PATH%/*}
SCRIPT_NAME=${SCRIPT_PATH##*/}

SOURCE_DIR=$1
shift

TARGET_DIR=$1
shift

if [ -z $TARGET_DIR ]; then
  echo "usage: $SCRIPT_NAME <source dir> <target dir> [other params to rsync]"
  exit 1
fi
rsync -rvh --delete-before --existing --ignore-existing --exclude '.sync' $@ ${SOURCE_DIR}/ ${TARGET_DIR}
