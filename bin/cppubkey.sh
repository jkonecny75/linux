#!/bin/sh

TARGET=$1

if [ -z "$TARGET" ]; then
  cat << EOF
Usage: $(basename $0) user@server
EOF
  exit 1
fi

if [ type "ssh-copy-id" &> /dev/null ]; then
  exec ssh-copy-id $TARGET
else
  cat ~/.ssh/id_rsa.pub | ssh $TARGET "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
fi
