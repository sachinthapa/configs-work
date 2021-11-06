#!/bin/sh

has_headset(){
  grep -A4 -ri 'Headphone Playback Switch' /proc/asound/card*/* | \
    grep "Amp-Out vals.*0x00 0x00" -q
}

#if amixer sget Headphone | grep -q "\[on\]"; then
if has_headset;then
    echo ''
else
    echo 'NO'
fi

snd_card_num=0
node_num="0x16"
snd_card_file="/proc/asound/card${snd_card_num}/codec#0"

# Run the check
cat "${snd_card_file}" \
    | grep -A 4 'Node $node_num' \
    | grep 'Amp-Out vals:  \[0x00 0x00\]' \
    > /dev/null

exit_state=$?

if [ $exit_state -eq 0 ]; then
    state="connected"
else
    state="disconnected"
fi

echo "$state"
exit $exit_state
