#! /bin/bash

echo $$ > "$HOME/.spotify-xbar/$(basename "$0").pid"

MUTED=false
AD_TRACKS='Advertisement'

function isRunning() {
    osascript -e "tell application \"System Events\" to (name of processes) contains \"$1\""
}

function currentTrack() {
    [ "$(isRunning Spotify)" == true ] && osascript -e 'tell application "Spotify" to name of current track as string'
}

while true; do
    track=$(currentTrack)
    echo "$track" > "$HOME/.spotify-xbar/.current-track"

    if [[ "$track" == "$AD_TRACKS" ]] && [ "$MUTED" == false ]; then
        # echo 'Advertisement detected, muting'
        MUTED=true
        osascript "$HOME"/.spotify-xbar/volume-mute.scpt
    elif [[ "$track" != "$AD_TRACKS" ]] && [ "$MUTED" == true ]; then
        # echo 'Advertisement ended, unmuting'
        MUTED=false
        osascript "$HOME"/.spotify-xbar/volume-mute.scpt
    fi

    sleep 1
done
