cd /home/perry/work
alias gopen="gnome-open"

#Config RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scriptin
source ~/.rvm/scripts/rvm

#Set git info
git config --global user.name "Perry Bhandal"
git config --global user.email "perry.bhandal@gmail.com"

alias fluxon="xflux -l 44.2312 -g -76.4860"
alias fluxoff="pkill xflux"
