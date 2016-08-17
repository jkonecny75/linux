#!/bin/sh
CMD='printf "\e[?2004l"'
echo $CMD

#exec command
$CMD

#copy to x-clipboard
echo "$CMD" | xclip -i
