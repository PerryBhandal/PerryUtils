cd /home/perry/work
alias gopen="gnome-open"

PATH="${PATH}:/home/perry/local_bin"

ANDROID_HOME=/home/perry/work/applications/android-sdk-linux
export ANDROID_HOME

#Set git info
git config --global user.name "Perry Bhandal"
git config --global user.email "perry.bhandal@gmail.com"

# Switch to simple push mode (only pushes current branch)
git config --global push.default simple

alias fluxon="xflux -l 44.2312 -g -76.4860"
alias fluxoff="pkill xflux"

alias rshiftOn="redshift -O 2500"
alias rshiftOff="redshift -O 6500"

alias ping="ping -O"

#Global gitignore
git config --global core.excludesfile '~/.gitignore_global'

alias undo_last_local_git_commit="git reset --soft HEAD~1"
alias auth_key="/home/perry/work/git/PerryUtils/systemConfigNotes/scripts/authKey.sh"

alias zipass="zip -e -r -T"

alias hostEnable="sudo ruby ~/.scripts/HostsManager/hostsManager.rb enable"
alias hostDisable="sudo ruby ~/.scripts/HostsManager/hostsManager.rb disable"

alias wifiKeyboard="~/.scripts/wifiKeyboard.sh"

alias tracktime="python ~/.scripts/track_time.py"
alias trackwork="python ~/.scripts/track_time.py Work"
alias trackbreak="python ~/.scripts/track_time.py Leisure"

alias gitnocomment="~/.scripts/gitNoComment.sh"
alias gitpnocomment="~/.scripts/gitNoComment.sh push"

export gitnocomment
export gitpnocomment

alias junkSync="~/.scripts/commitJunkRepo.sh"

alias pyinit="echo > __init__.py"

alias activate="source venv/bin/activate"
alias init_env="virtualenv -p python venv; activate; pip install -r requirements/dev.txt"

alias init_env3="virtualenv -p python3 venv; activate; pip3 install -r requirements/dev.txt"


alias sitesnap="ruby ~/.scripts/site_snap.rb"

alias combinetopdf="rm /home/perry/Desktop/combined.pdf; sudo libreoffice --headless --convert-to pdf {*.odt,*.docx}; pdfunite *.pdf combined.pdf.hold; sudo rm *.pdf; mv combined.pdf.hold /home/perry/Desktop/combined.pdf; gopen /home/perry/Desktop/combined.pdf"

export CHROME_BIN="/usr/bin/chromium-browser"

alias genbase="ruby ~/.scripts/gen_base.rb"
#alias genebase="ruby ~/.scripts/gen_base.rb e"


# Prevent commands prefixed by a space from showing in Bash history.
export HISTCONTROL=ignorespace

alias idea="/home/perry/work/applications/idea/bin/idea.sh"
alias android="/home/perry/work/applications/android-studio/bin/studio.sh"
alias eclipse="/home/perry/work/applications/eclipse/eclipse"

export idea
export android

alias wifitoggle="sudo rfkill block wifi; sudo rfkill unblock wifi"
export wifitoggle
