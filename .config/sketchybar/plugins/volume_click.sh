#!/usr/bin/env osascript
#
if output muted of (get volume settings) is false then
        set volume with output muted
else
        set volume without output muted
end if

do shell script "sh $HOME/.config/sketchybar/plugins/volume.sh"
