#!/bin/sh

# Dvd2Avi 0.2
# Only does one title at a time, but "avimerge" from Transcode
# can sort it from there.

# by yyz

echo -n "Enter the name of output file (without extension):"
read FILE

echo -n "Enter the title you wish to rip:"
read TITLE

echo -n "Select a quality level (h/n/l)[[n]]:"
read Q

if [[ -z $Q ]];then 
    # If no quality passed, default to normal
    Q=n
fi

if [[ $Q = h ]]; then 
# If h passed, use high quality
mencoder dvd://$TITLE -dvd-device=/dev/sr0 -alang cs -oac mp3lame -lameopts br=320:cbr -ovc lavc -lavcopts vcodec=mpeg4:vhq -vf scale -zoom -xy 800 -o $FILE.avi
exit $?
fi

if [[ $Q = n ]]; then 
# If n passed, use normal quality (recommended)
mencoder dvd://$TITLE -alang en -oac mp3lame -lameopts br=160:cbr -ovc lavc -lavcopts vcodec=mpeg4:vhq -vf scale -zoom -xy 640 -o $FILE.avi
exit $?
fi

if [[ $Q = l ]]; then 
# If l passed, use low quality. not really worth it, 
# hardly any smaller but much crappier
mencoder dvd://$TITLE -alang en -oac mp3lame -lameopts br=96:vbr -ovc lavc -lavcopts vcodec=mpeg4:vhq -vf scale -zoom -xy 320 -o $FILE.avi
exit $?
fi
