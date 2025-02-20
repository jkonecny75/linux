#!/bin/sh

ls --zero *.wav | xargs --null -I {} sh -c 'f="{}"; lame "$f" "${f%%.*}.mp3"'
