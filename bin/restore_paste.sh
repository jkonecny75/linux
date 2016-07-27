#!/bin/sh
printf "\e[?2004l"
exec echo 'printf "\e[?2004l"' | xclip -i
