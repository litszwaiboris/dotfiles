# Homebrew autocompletions
eval "$(/opt/homebrew/bin/brew shellenv)"

# Suppress fish shell greeting
set fish_greeting

if status is-interactive
	cd $HOME
	pfetch
end
starship init fish | source
