#! /bin/bash

mkdir "$HOME/.spotify-xbar"
ln -s "$(pwd)/spotify-adblock.sh" "$HOME/.spotify-xbar/spotify-adblock.sh"
ln -s "$(pwd)/volume-mute.scpt" "$HOME/.spotify-xbar/volume-mute.scpt"

ln -s "$(pwd)/spotify.2s.sh" "$HOME/Library/Application Support/xbar/plugins/spotify.2s.sh"
