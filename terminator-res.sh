#!/bin/bash
# A simple script to set the default gnome-terminal font size based on the current screen 
# resolution. (Maybe restructure the if/then/else to include more resolutions later...)

# Export display resolution for scripting based on system resolution.
export DISPLAY_RESOLUTION=$(xrandr --current | grep '*' | uniq | awk '{print $1}')

#Set the default profile for 4k resolution.
if [[ "$DISPLAY_RESOLUTION" == "3840x2160" ]]; then
    terminator -p "4K" -m -l "4K"
    logger Launched Terminator with profile and layout '4K'.
#  echo Resolution is 4K.  #For testing - quotes removed.
else
#Set the default profile for non 4K resolution.
    terminator -p "1080p or lower" -m -l "1080p"
    logger Launched Terminator with profile and layout, 'l080p or lower,' and '1080p.'
#  echo Resolution is $DISPLAY_RESOLUTION.  #For testing - quotes removed.
fi
