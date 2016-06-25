#!/bin/sh
mencoder -oac copy -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=140 -ffourcc XVID mf://*.JPG -mf fps=20 -o bazen.avi 2> /dev/null > /dev/null || echo "Mplayer neuspel"

