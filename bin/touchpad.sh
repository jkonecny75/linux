#!/bin/sh

#xinput list
ACTION=disable
case $1 in
  off|disable) ACTION=disable;;
  on|enable) ACTION=enable;;
esac
xinput $ACTION "$(xinput list --name-only | grep -i Touchpad)"
