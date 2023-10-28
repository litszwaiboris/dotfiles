#!/bin/bash
ARTIST=$(osascript -e 'if application "Spotify" is running then
        tell application "Spotify"
	set a to the current track
	set b to artist of a as text
        return b
        end tell
end if')
ALBUM=$(osascript -e 'if application "Spotify" is running then
        tell application "Spotify"
	set a to the current track
	set b to album of a as text
	return b
        end tell
end if')

TITLE=$(osascript -e 'if application "Spotify" is running then
        tell application "Spotify"
	set a to the current track
	set b to name of a as text
	return b
        end tell
end if')

LABEL="${TITLE} - ${ARTIST}"

CHECK=$(osascript -e 'on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running
set a to is_running("Spotify")
if a then
	return "a"
else
	return "b"
end if')