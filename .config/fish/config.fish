# Homebrew autocompletions
eval "$(/opt/homebrew/bin/brew shellenv)"

# Suppress fish shell greeting
set fish_greeting

if status is-interactive
        pfetch
end
starship init fish | source
