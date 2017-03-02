echo "Hello tutu"
export PS1="\W 🐣 🐸 \$ "
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagaced

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels

# Git
alias gi='git init'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'



# rails
alias rs='rails s'
alias rc='rails c'
alias bd='bundle'
alias reset='rails db:reset'
alias mig='rails db:migrate'
alias r='rails'
