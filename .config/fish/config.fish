set fish_greeting

if status is-interactive
    starship init fish | source
    fastfetch
end
