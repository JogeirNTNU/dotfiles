#!/bin/bash

MIC_NAME="alsa_input.usb-Generic_Blue_Microphones_2036BAB09NT8-00.analog-stereo"

# Set volume on Blue Yeti microphone to 50% on startup
pactl set-source-volume "$MIC_NAME" 50% 2>/dev/null

# Listen for system changes. Every time a new source is connected, force
# the volume on Blue Yeti microphone to 50%
pactl subscribe | grep --line-buffered "Event 'new' on source" | while read -r hending; do
  pactl set-source-volume "$MIC_NAME" 50% 2>/dev/null
done
