# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# colors ------------------------------------------
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m' # No Color

# Text color variables
txtund=$(tput sgr 0 1)    # Underline
txtbld=$(tput bold)       # Bold
txtred=$(tput setaf 1)    # Red
txtgrn=$(tput setaf 2)    # Green
txtylw=$(tput setaf 3)    # Yellow
txtblu=$(tput setaf 4)    # Blue
txtpur=$(tput setaf 5)    # Purple
txtcyn=$(tput setaf 6)    # Cyan
txtwht=$(tput setaf 7)    # White
txtrst=$(tput sgr0)       # Text reset

# GIT awesomeness ---------------------------------
alias gitka='gitk --all'
alias branches='git branch'

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}

export PS1='\u@\h ${PWD%/*}/${txtbld}${PWD##*/}${txtrst} ${txtgrn}$(parse_git_branch)${txtrst}\n$ '

# DISPER ------------------------------------------
alias disper="$HOME/disper/trunk/src/cli.py"

# FUNCTIONS ---------------------------------------
findgrep() { find . -type f -exec grep --colour -nHr "$1" {} \; ; }
psgrep() { ps aux | grep "$1"; }

# ALIAS -------------------------------------------
alias roo='roo.sh'
alias la='ls -a'
alias lah='ls -lah'
alias l='ls'

alias mvnc='mvn -Dsurefire.useFile=false'
alias mvnst='mvn -DskipTests=true'

alias commits-per-author='git shortlog -s -n'

# ANT ---------------------------------------------
export ANT_HOME="$HOME/coding/apache-ant-latest"

complete -C complete-ant-cmd.pl ant

# PATH --------------------------------------------

export PATH="$PATH:~/.conky_scripts"
export PATH="$PATH:~/coding/libs/android-latest/platform-tools"

export GRIFFON_HOME="~/coding/libs/griffon-latest"

export PATH="$PATH:~/coding/apache-ant-latest/bin"
#export PATH="~/coding/libs/griffon-latest"
export PATH="$PATH:~/coding/git-achievements"
export PATH="$PATH:~/local/node/bin"
export PATH="$PATH:~/coding/libs/spring-roo-latest/bin"

export SCALA_HOME=$HOMW/coding/libs/scala-2.8.1.final
export PATH=$PATH:$SCALA_HOME/bin

export JREBEL_HOME=/home/ktoso/JRebel
export MSEJF_HOME=/home/ktoso/coding/xsolve/msejf_home

alias rvmsudo='/usr/lib/ruby/gems/1.8/gems/rvm-1.0.19/binscripts/rvmsudo'

alias git="git-achievements"
alias sbt="java -Xmx512M -jar $HOME/coding/sbt/sbt-launch.jar '$@'"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
