
# 
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
#                         

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/erne/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

# Adding some additional keybindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3~' delete-char

# Tab completion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:default' list-colors ma=0\;15

# What if the programme is not installed?
[[ -a "/etc/zsh_command_not_found" ]] && . /etc/zsh_command_not_found

# Auto CD
setopt auto_cd

# correct the mistyped command
setopt CORRECT

# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# 
# ┌┬┐┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐┌─┐
#  ││├┤ ├┤ ├─┤│ ││  │ └─┐
# ─┴┘└─┘└  ┴ ┴└─┘┴─┘┴ └─┘
# 
export BROWSER="brave-browser"
export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="vim"
export DIFFPROG="colordiff"

# Set the right locale for cal
alias cal='cal -m'

# 
# ┌─┐┌─┐┌─┐┌┬┐┬ ┬┌─┐┌┬┐┬┌─┐┌─┐
# ├─┤├┤ └─┐ │ ├─┤├┤  │ ││  └─┐
# ┴ ┴└─┘└─┘ ┴ ┴ ┴└─┘ ┴ ┴└─┘└─┘
# 

# Enable colours
command -v eza > /dev/null && alias ls='eza -lah --group-directories-first'
command -v eza > /dev/null && alias tree='lsd --tree'
alias cat='batcat --theme=ansi --pager=never -p'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export MANROFFOPT=-c

# Syntax highlighting and autosuggesting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'

# Show an underline cursor while on xterm
if [[ $TERM == "xterm" ]]; then
	echo -e "\e[4 q"
fi

# Set a fancy prompt
if [[ $(tty) =~ /dev/tty ]]; then
	export STARSHIP_CONFIG=~/.config/starship-tty.toml
else
	export STARSHIP_CONFIG=~/.config/starship-gui.toml
fi

eval "$(starship init zsh)"

# Start with a colourscript and a fortune cookie
export FORTUNE=$(fortune -s)
if [[ $TERM == "xterm-kitty" || $TERM =~ "256color" ]]; then
    echo -e "\n\e[3m${FORTUNE}"
else 
    echo -e "\n${FORTUNE}"
fi

# 
# ┌─┐┬  ┬┌─┐┌─┐┌─┐┌─┐
# ├─┤│  │├─┤└─┐├┤ └─┐
# ┴ ┴┴─┘┴┴ ┴└─┘└─┘└─┘
#

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi
