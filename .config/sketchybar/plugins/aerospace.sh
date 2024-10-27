LABEL=$(aerospace list-workspaces --focused)

TITLE=$(osascript -e 'tell application "System Events" to tell (first process whose frontmost is true) to return name')

sketchybar -m --set $NAME label="$LABEL - $TITLE" icon=" "
