# basic info output on terminal open
#draw a random pokemon sprite on opening a new session
pokemon-colorscripts -r --no-title

# allow for vim functionalities
set -o vi

# Shouldn't have to do this but...
source ~/.zprofile

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # includes hidden files


#use spaceship for command prompt
eval "$(starship init zsh)"

#aliases 
alias icloud='cd /Users/melissa/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias l='ls -lah'
alias la='ls -aG'
alias ll='ls -laG'
alias ls='ls -G'
alias lsa='ls -lah'
alias w23='cd /Users/melissa/Library/Mobile\ Documents/com~apple~CloudDocs/School/CarletonU/Year\ 2/Winter\ 2023/'
alias angela='ssh melissa@192.168.1.110'
