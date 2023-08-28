#!/usr/bin/env osascript

using terms from application "Spotify"
	tell application "Spotify" to playpause
end using terms from

delay 1

do shell script "sh $HOME/.config/sketchybar/plugins/music.sh"

