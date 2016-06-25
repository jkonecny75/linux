#!/bin/sh

IFS="
"
for i in `ls -1A`; do
  du -sm "$i";
done | sort -n  
