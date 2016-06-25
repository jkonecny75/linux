#!/bin/sh
# wodim -checkdrive
# genisoimage -R -J -o cd.raw .
genisoimage -R -J . | wodim  dev=/dev/sr0 driveropts=burnfree -
