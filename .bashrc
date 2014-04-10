# .bashrc

export EDITOR=vim

# solarized terminal
export CLICOLOR=1
export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
export TERM=screen-256color       # for a tmux -2 session (also for screen)
alias dircolors=gdircolors
#eval `gdircolors $HOME/dircolors-solarized/dircolors.256dark`

# lang fix
export LC_CTYPE='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'

# constants
export CODE_HOME=$HOME/code

# act like macos open
alias open='kde-open'

# vim vim
alias vimvim='vim ~/.vimrc'

# fix ack conflicts
alias ack-kanji='/usr/bin/ack'
alias ack='ack-grep'

# bash autocomplete on mac
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

# laptop x1 battery state (ubuntu)
alias battery-status="acpi -b | head -n1 | awk '{print \$4-0}';"

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# ls fixing for mac
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi

# home bin
export PATH=$PATH:$HOME/bin

#fixing KDE
export PATH=$PATH:/usr/lib/kde4/bin

# npm
export PATH=$PATH:/usr/local/share/npm/bin

# scala
export SCALA_HOME=$HOME/opt/scala-latest
export PATH=$PATH:$SCALA_HOME/bin

# google compute cloud - gcutil
export PATH=$PATH:$HOME/opt/gcutil-latest

# sbt
export SBT_OPTS='-Xmx=1500m -XX:MaxPermSize=800m -XX:+CMSClassUnloadingEnabled'
alias sbt=$CODE_HOME/sbt-extras/sbt

# golang
alias godocs-offline='godoc -http=:6060 && echo "Started godocs on http://localhost:6060"'
export GO_HOME="$HOME/opt/go/bin"

# Useful aliases
alias ls='ls $LS_OPTIONS -hF'
alias la='ls -a $LS_OPTIONS -hF'
alias ll='ls -la $LS_OPTIONS -hF'
alias c="clear"
alias e="exit"
alias ssh="ssh -X"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# alias git
alias gsh='git sh'
alias purr='git purr'

# pbcopy and pbpaste
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

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
alias st='git st'
alias gitka='gitk --all'
alias branches='git branch'

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}

function pwd_rep {
  echo "${PWD%/*}" | sed 's|/home/ktoso|~|'
}

export PS1='\u @ ${txtbld}月${txtrst}$(pwd_rep)/${txtbld}${PWD##*/}${txtrst} ${txtgrn}$(parse_git_branch)${txtrst}\n$ '

# FUNCTIONS ---------------------------------------
findgrep() { find . -type f -exec grep --colour -nHr "$1" {} \; ; }
psgrep() { ps aux | grep "$1"; }

# ALIAS -------------------------------------------
alias la='ls -a'
alias lah='ls -lah'
alias l='ls'

# Maven
export PATH="$PATH:$HOME/opt/maven-latest/bin"
alias mvnc='mvn -Dsurefire.useFile=false'
alias mvnst='mvn -DskipTests=true'

alias commits-per-author='git shortlog -s -n'

alias yap_grep='iconv -f UTF-16 -t UTF-8 | grep'
alias yap_cat='iconv -f UTF-16 -t UTF-8'

# play framework
export PATH="$PATH:$HOME/opt/play-latest"

# ANT ---------------------------------------------
export ANT_HOME="$CODE_HOME/apache-ant-latest"

complete -C complete-ant-cmd.pl ant

#JAVA
export JDK_HOME="/usr/lib/jvm/jdk1.7.0_21"
export JAVA_HOME="$JDK_HOME"

#MAVEN
export M2_HOME="/home/ktoso/opt/maven-latest"

# HADOOP ------------------------------------------
export HADOOP_HOME="$HOME/opt/hadoop-latest"
export PATH="$PATH:$HADOOP_HOME/bin"
export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"

# Some convenient aliases and functions for running Hadoop-related commands
unalias fs &> /dev/null
alias fs="hadoop fs"
alias ofs="hadoop fs -conf /etc/hadoop/core-site.xml"

unalias hls &> /dev/null
alias hls="fs -ls"
alias ols="ofs -ls"

alias hup="fs -copyFromLocal"
alias oup="ofs -copyFromLocal"

alias hdown="fs -getmerged"
alias odown="ofs -getmerged"

# HASKELL -----------------------------------------
export PATH="$HOME/Library/Haskell/bin:$PATH"

# PATH --------------------------------------------

# GRAILS
export GRAILS_HOME=$CODE_HOME/libs/grails-2.0.0
export PATH="$PATH:$GRAILS_HOME/bin"

# AKKA
export AKKA_HOME=$CODE_HOME/libs/akka-microkernel-latest
export PATH="$PATH:$AKKA_HOME/bin"

# ANDROID
export ANDROID_HOME=$CODE_HOME/libs/android-sdk-macosx
export PATH=$ANDROID_HOME/tools:$PATH
alias adb=/Users/ktoso/code/libs/android-latest/platform-tools/adb

export PATH="$PATH:/Users/ktoso/bin"
export PATH="$PATH:~/scripts"

export PATH="$PATH:$CODE_HOME/libs/scala-latest/bin"
export PATH=$PATH:$SCALA_HOME/bin

export JREBEL_HOME=/home/ktoso/JRebel

# GO
export GOROOT=$HOME/opt/go
export PATH=$PATH:$GOROOT/bin

# use yum with sudo always
alias yum="sudo apt-get"
alias canihaz="sudo apt-get install"
alias canihazupdate="sudo apt-get update ; sudo apt-get upgrade"
alias update-all-the-things="sudo apt-get update && sudo apt-get upgrade"

alias wq="exit"

alias prolog="swipl"

# sidewinder
# sudo $CODE_HOME/LinuxSidewinderX6/sidewinder-x6-macro-keys 2> /dev/null

# z
. $CODE_HOME/z/z.sh

alias sonar-runner=$HOME/opt/tools/sonar-runner-1.1/bin/sonar-runner

# glassfish
alias asadmin=$HOME/opt/servers/glassfish3/glassfish/bin/asadmin

# pretty json
# gem install json
alias pretty_json=prettify_json.rb
alias json=prettify_json.rb

# vim helpers
alias vibashrc='vim $HOME/.bashrc && source $HOME/.bashrc'
alias vimonad="vim $HOME/.xmonad/xmonad.hs && echo 'Compiling [xmonad.hs]...' && xmonad --recompile"
alias vimobar="vim $HOME/.xmonad/xmobarrc"

# put scala in the path
export PATH=$HOME/scala/bin:$PATH

# put opt/scripts into path
export PATH=$HOME/opt/scripts:$PATH

# macos battery status
alias bat='pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d";"'

export PATH=/Applications/SenchaSDKTools-2.0.0-Beta:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Beta/bin:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Beta/jsbuilder:$PATH

alias whatismyip='curl ip.appspot.com'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

# gpg
export GPG_KEY='DF4A7B51'

# add whirr to path
export PATH="$PATH:/Users/ktoso/opt/whirr-0.8.1/bin"

# source aws keys
source $HOME/.aws.export

# fight too many open files
ulimit -S -n 2048

# xmonad
export PATH=$PATH:~/.cabal/bin:~/.xmonad/bin

