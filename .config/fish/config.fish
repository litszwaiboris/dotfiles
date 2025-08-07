set fish_greeting

if status is-interactive
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    starship init fish | source
    fastfetch
end
