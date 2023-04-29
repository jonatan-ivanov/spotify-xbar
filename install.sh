#! /bin/bash

mkdir "$HOME/.spotify-xbar"
ln -s "$(pwd)/spotify-adblock.sh" "$HOME/.spotify-xbar/spotify-adblock.sh"
ln -s "$(pwd)/blocked.txt" "$HOME/.spotify-xbar/blocked.txt"
ln -s "$(pwd)/add-current-ad.sh" "$HOME/.spotify-xbar/add-current-ad.sh"

ln -s "$(pwd)/spotify.2s.sh" "$HOME/Library/Application Support/xbar/plugins/spotify.2s.sh"
