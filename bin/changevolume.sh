#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="myvolume"
# Change the volume using alsa(might differ if you use pulseaudio)
amixer -D pulse set Master "$@" > /dev/null

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(amixer -D pulse get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(amixer -D pulse get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
if [[ $volume == 0 || "$mute" == "off" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag " Volume muted" 
elif [[ $volume -lt 35 ]]; then
   dunstify -a "changeVolume" -u low -i audio-volume-low -h string:x-dunst-stack-tag:$msgTag \
      -h int:value:"$volume" " Volume: ${volume}%" 
elif [[ $volume -ge 35 ]] && [[ $volume -lt 70 ]]; then
    dunstify -a "changeVolume" -u low -i audio-volume-medium -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:"$volume" " Volume: ${volume}%"
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" " Volume: ${volume}%"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
