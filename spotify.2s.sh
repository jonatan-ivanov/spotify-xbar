#! /bin/bash

#  <xbar.title>Spotify Bar</xbar.title>
#  <xbar.version>v0.1</xbar.version>
#  <xbar.author>Jonatan Ivanov</xbar.author>
#  <xbar.author.github>jonatan-ivanov</xbar.author.github>
#  <xbar.desc>Minimalistic Spotify bar</xbar.desc>
#  <xbar.image>https://storage.googleapis.com/pr-newsroom-wp/1/2018/11/Spotify_Logo_RGB_Green.png</xbar.image>
#  <xbar.dependencies>bash, pgrep, osascript</xbar.dependencies>
#  <xbar.abouturl>https://develotters.com</xbar.abouturl>


function startAdBlock() {
    "$HOME/.spotify-xbar/spotify-adblock.sh" &
}

pgrep -F "$HOME/.spotify-xbar/spotify-adblock.sh.pid" &> /dev/null || startAdBlock &> /dev/null
track=$(cat "$HOME/.spotify-xbar/.current-track") &> /dev/null

[[ "$track" = !!AD:* ]] && echo ':musical_score:' || echo ':musical_note:'
echo '---'
echo "$track"
