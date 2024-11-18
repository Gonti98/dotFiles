# ~/.bash_aliases

# File and directory listing aliases
alias ll='ls -l'
alias la='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Fastfetch with custom options
alias ff='fastfetch'

# Git Aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gb='git branch'
alias gcl='git clone'

# Docker Aliases
alias dps='docker ps'                            # Show running containers
alias dstop='docker stop $(docker ps -q)'         # Stop all running containers
alias drm='docker rm $(docker ps -a -q)'          # Remove all stopped containers
alias dim='docker images'                         # List Docker images
alias drun='docker run -it'                       # Run new interactive container
alias dlogs='docker logs -f'                      # Follow logs of a container
alias dexec='docker exec -it'                     # Run commands inside running container

# APT Aliases (for system package management)
alias update='sudo apt update && sudo apt upgrade -y'   # Full system update
alias install='sudo apt install'                        # Install packages
alias remove='sudo apt remove'                          # Remove packages
alias search='apt search'                               # Search for a package
alias clean='sudo apt autoremove && sudo apt clean'     # Clean up unused packages
alias cl='clear'					# Clear the screen

# Zellij Aliases
alias ze='zellij'
alias za='zellij attach'
alias zam='zellij attach main'

#Kubernetes Aliases
alias k='kubectl'

# NeoVim Aliases
alias vi='nvim'
