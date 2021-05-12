#!/bin/bash

SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=${SCRIPT_PATH%/*}
SCRIPT_NAME=${SCRIPT_PATH##*/}

TARGET_DIR=$1
shift

if [ -z $TARGET_DIR ]; then
  echo "usage: $SCRIPT_NAME <target dir> [other params to rsync]"
  echo --dry-run, -n            perform a trial run with no changes made
  echo --del                    an alias for --delete-during
  exit 1
fi

if [ ! -d "${TARGET_DIR}" ]; then
  echo "directory ${TARGET_DIR} does not exist"
  exit 1
fi

rsync $@ -rvh --modify-window=2 --size-only --ignore-times $@ ./ ${TARGET_DIR}

#rsync $DELETE -ahv --modify-window 1 --no-perms --no-owner --no-group --ignore-times $@ . $TARGET_DIR
