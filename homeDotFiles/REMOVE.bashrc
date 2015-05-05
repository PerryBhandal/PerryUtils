cd /home/perry/work
alias gopen="gnome-open"

#Config RVM
export PATH="$PATH:$HOME/.rvm/bin:/opt/caslab/bin:$HOME/local_bin" # Add RVM to PATH for scriptin
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

alias activate="source venv/bin/activate"

alias sitesnap="ruby ~/.scripts/site_snap.rb"

alias combinetopdf="rm /home/perry/Desktop/combined.pdf; sudo libreoffice --headless --convert-to pdf *.odt; pdfunite *.pdf combined.pdf.hold; sudo rm *.pdf; mv combined.pdf.hold /home/perry/Desktop/combined.pdf; gopen /home/perry/Desktop/combined.pdf"

export CHROME_BIN="/usr/bin/chromium-browser"

alias genbase="ruby ~/.scripts/gen_base.rb"
