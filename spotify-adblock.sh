#! /bin/bash

echo $$ > "$HOME/.spotify-xbar/$(basename "$0").pid"

ADS_PATTERN="^($(echo -n "$(cat "$HOME/.spotify-xbar/blocked.txt")" | tr '\n' '|'))$"
MUTED=false

function isRunning() {
    osascript -e "tell application \"System Events\" to (name of processes) contains \"Spotify\""
}

function playerState() {
    osascript -e 'tell application "Spotify" to player state'
}

function currentTrack() {
    osascript -e 'tell application "Spotify" to name of current track as string'
}

function currentArtist() {
    osascript -e 'tell application "Spotify" to artist of current track'
}

function isAdvertisement() {
    if [[ -z  "$1" ]]; then
        echo 'true';
    elif [[ "$1" =~ $ADS_PATTERN ]]; then
        echo 'true';
    else
        echo 'false';
    fi
}

while true; do
    if [[ "$(isRunning)" == true && "$(playerState)" == 'playing' ]]; then
        track=$(currentTrack)
        isAd="$(isAdvertisement "$track")"

        if [[ "$isAd" == true ]]; then
            echo "!!AD:$track" > "$HOME/.spotify-xbar/.current-track"
        else
            echo "$track by $(currentArtist)" > "$HOME/.spotify-xbar/.current-track"
        fi

        if [[ "$isAd" == true ]] && [ "$MUTED" == false ]; then
            # echo 'Advertisement detected, muting'
            MUTED=true
            osascript -e 'tell application "Spotify" to set sound volume to 0'
        elif [[ "$isAd" == false ]] && [ "$MUTED" == true ]; then
            # echo 'Advertisement ended, unmuting'
            MUTED=false
            osascript -e 'tell application "Spotify" to set sound volume to 100'
        fi
    else
        echo '' > "$HOME/.spotify-xbar/.current-track"
    fi

    sleep 1
done
