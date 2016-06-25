#!/bin/sh

label=${1-movie}

# vymaze DVD
# dvd+rw-format -blank /dev/sr0

# vypali ISO IMG
# growisofs -dvd-compat -Z /dev/sr0=image.iso

# prepali DVD z jedne mechaniky do druhe
# growisofs -dvd-compat -Z /dev/sr0=/dev/sr1

# vypali aktualni adresar
growisofs -Z /dev/sr0 -R -J -joliet-long -V $label .
