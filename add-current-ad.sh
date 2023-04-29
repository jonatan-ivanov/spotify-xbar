#! /bin/bash

osascript -e 'tell application "Spotify" to name of current track as string' >> "$HOME/.spotify-xbar/blocked.txt"
kill "$(cat "$HOME/.spotify-xbar/spotify-adblock.sh.pid")"
