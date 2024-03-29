export LANG=en_US.UTF-8
alias gopen="gnome-open 2>/dev/null"
PATH="${PATH}:/home/perry/work/applications/local_bin:/home/perry/.scripts/pathed_scripts:/home/perry/work/applications/in_path:/home/perry/Android/sdk/emulator/"

ANDROID_HOME=/home/perry/work/applications/android-sdk-linux
export ANDROID_HOME

#### Recent entries

export FLASK_ENV=development

####

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

alias cpu_set="python /home/perry/work/git/PerryUtils/systemConfigNotes/scripts/cpu_set.py"

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
alias init_env="virtualenv -p python venv; activate; pip install -r requirements/dev.txt; ./init_env.sh 2> /dev/null"
alias init_env3="virtualenv -p /usr/bin/python3 venv; activate; pip3 install -r requirements/dev.txt; pip3 install colorama PyUserInput zope.interface pyinotify; ./init_env.sh 2> /dev/null"

alias sitesnap="ruby ~/.scripts/site_snap.rb"

alias combinetopdf="rm /home/perry/Desktop/combined.pdf; sudo libreoffice --headless --convert-to pdf {*.odt,*.docx}; pdfunite *.pdf combined.pdf.hold; sudo rm *.pdf; mv combined.pdf.hold /home/perry/Desktop/combined.pdf; gopen /home/perry/Desktop/combined.pdf"

export CHROME_BIN="/usr/bin/chromium-browser"

alias genbase="ruby ~/.scripts/gen_base.rb"
#alias genebase="ruby ~/.scripts/gen_base.rb e"
alias genwatch="cp ~/.scripts/workspace_prepare/wsp_example.sh prep_workspace.sh"

# Prevent commands prefixed by a space from showing in Bash history.
export HISTCONTROL=ignorespace

alias idea="/home/perry/work/applications/idea/bin/idea.sh"
alias android="/home/perry/work/applications/android-studio/bin/studio.sh"
alias eclipse="/home/perry/work/applications/eclipse/eclipse"
alias pycharm="/home/perry/work/applications/pycharm/bin/pycharm.sh"

export idea
export android

alias wifitoggle="sudo rfkill block wifi; sudo rfkill unblock wifi"
export wifitoggle

alias bs="sleep 1; source /home/perry/.bashrc; rm -f /tmp/cur_shot.png; gnome-screenshot -a -f /tmp/cur_shot.png; xclip -i -selection c -t image/png /tmp/cur_shot.png; exit 0"

kill_guard_procs () {
for KILLPID in `ps ax | grep 'guard' | awk ' { print $1;}'`; do 
  kill -9 $KILLPID;
done
}

alias killguard="kill_guard_procs"

alias gvim="vim -g"
export gvim

# TODO [1]: Iterate over the number of cores instead of manually doing it as you do below (move it into a Python script?
# TODO [0]: Here's the for loop to do it: for ((i=0;i<$(nproc);i++)); do sudo cpufreq-set -c $i -r -g performance; done
alias cpu_performance="sudo cpufreq-set -r -g performance 0-r; sudo cpufreq-set -r -g performance 1-r; sudo cpufreq-set -r -g performance 2-r;  sudo cpufreq-set -r -g performance 3-r"
alias cpu_powersave="sudo cpufreq-set -r -g powersave 0-r; sudo cpufreq-set -r -g powersave 1-r; sudo cpufreq-set -r -g powersave 2-r;  sudo cpufreq-set -r -g powersave 3-r"

export cpu_performance
export cpu_powersave

# Disable XON/XOFF flow control. Ensures ctrl + s doesn't hang your terminal (previously had to ctrl + q to re-enable terminal when ctrl +s froze it).
stty -ixon

alias vnc_connect="vncviewer 192.168.1.10:5900"
export vnc_connect

export TERM=xterm-256color
PS1='\[\033[1;32m\]\u\[\033[1;32m\]@\[\033[1;32m\]\h:\[\033[1;34m\]\w\[\033[1;34m\]\$\[\033[0m\] '

export ag="ag -f"

alias ls="ls --color"
export ls

source ~/.git-completion.bash

PYTHONPATH="${PYTHONPATH}:/home/perry/work/git/pyriel/src/:/home/perry/work/git/rclib/tools/actions/"
export PYTHONPATH


function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}
