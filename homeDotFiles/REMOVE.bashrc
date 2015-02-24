cd /home/perry/work
alias gopen="gnome-open"

#Config RVM
export PATH="$PATH:$HOME/.rvm/bin:/opt/caslab/bin" # Add RVM to PATH for scriptin
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
alias wifiKeyboard="~/.scripts/wifiKeyboard.sh"

alias trackTime="python ~/.scripts/track_time.py"

alias gitnocomment="~/.scripts/gitNoComment.sh"
alias gitpnocomment="~/.scripts/gitNoComment.sh push"

export gitnocomment
export gitpnocomment

alias junkSync="~/.scripts/commitJunkRepo.sh"

alias pyinit="echo > __init__.py"

alias cloc="perl /home/perry/work/programmingSVN/Tools/CodeCount/cloc-1.58.pl"

alias ls="ls -h"
