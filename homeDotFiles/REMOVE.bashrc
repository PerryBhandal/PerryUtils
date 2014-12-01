cd /home/perry/work
alias gopen="gnome-open"

#Config RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scriptin
source ~/.rvm/scripts/rvm

#Set git info
git config --global user.name "Perry Bhandal"
git config --global user.email "perry.bhandal@gmail.com"

# Switch to simple push mode (only pushes current branch)
git config --global push.default simple

alias fluxon="xflux -l 44.2312 -g -76.4860"
alias fluxoff="pkill xflux"

#Global gitignore
git config --global core.excludesfile '~/.gitignore_global'

alias undo_last_local_git_commit="git reset --soft HEAD~1"
alias auth_key="/home/perry/work/git/PerryUtils/systemConfigNotes/scripts/authKey.sh"

alias zipass="zip -e -r -T"

alias hostEnable="sudo ruby ~/.scripts/HostsManager/hostsManager.rb enable"
alias hostDisable="sudo ruby ~/.scripts/HostsManager/hostsManager.rb disable"
