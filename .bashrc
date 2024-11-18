# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings: avoid duplicates and append to history
HISTCONTROL=ignoreboth      # Don't put duplicate lines or lines starting with space in the history
shopt -s histappend         # Append to the history file, don't overwrite it
HISTSIZE=1000               # Maximum number of history entries
HISTFILESIZE=2000           # Maximum size of the history file

# Update window size after each command
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt settings: color support based on terminal type
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Force colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # Color support is available
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Set the prompt appearance
if [ "$color_prompt" = yes ]; then
    PS1="\[\033[1;32m\]\A \[\033[0;33m\]\u\[\033[00m\] ▶ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h\$ '
fi
unset color_prompt force_color_prompt

# Set title for xterm
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# Enable color support for ls and other utilities
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Add LS_COLORS for enhanced file type coloring
export LS_COLORS="di=1;34:ln=36:so=32:pi=33:ex=1;32:bd=1;33:cd=1;33:su=37:sg=30:tw=30:ow=34"

# Alert alias for long-running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]//g'\'')"' 

# Load additional aliases if available
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
