# Fiaboo's Fish config
# Shell: Fish 4.0.2 + Starship

# PATH
fish_add_path ~/.local/bin
fish_add_path ~/go/bin

# Aliases
alias g="git"
alias n="nvim"
alias ls="lsd"
alias tree="lsd --tree"
alias y="yazi"

# Recording aliases
alias rec="$HOME/.config/niri/scripts/record-region.sh"
alias recfull="$HOME/.config/niri/scripts/record-main.sh"
alias rec-stop="pkill wf-recorder"

# SSH via kitty kitten
alias ssh="kitty +kitten ssh"

# Starship prompt
starship init fish | source

# Fastfetch on shell start
function fish_greeting
end

if status is-interactive
    fastfetch
end
alias music="nohup mpv --really-quiet --force-window=no ~/Music/*.mp3 > /dev/null 2>&1 &; disown"

