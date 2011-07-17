# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
#export KMIX_PULSEAUDIO_DISABLE=1


#blender fix
export LIBGL_ALWAYS_SOFTWARE=1
export PYTHONPATH=/usr/bin/python

# --------------- amazing git/svn command prompt ------------------------
parse_git_branch () {
   git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
}
parse_svn_branch() {
   parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
}
parse_svn_url() {
   svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
   svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}
 
BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"
 
alias awesome_ps1='export PS1="$BLACK[ \u@$RED\h $GREEN\w$RED_BOLD\$(parse_git_branch)\$(parse_svn_branch)$BLACK ] "'

# --------------- java stuff --------------------------------------------

export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_26
export IDEA_JDK=$JAVA_HOME
export ANDROID_HOME=$HOME/coding/libs/android-latest
export ANT_HOME=/home/ktoso/coding/apache-ant-latest

# grails stuff
export GRAILS_HOME=$HOME/coding/libs/grails-latest
PATH=$PATH:$HOME/bin:$HOME/jdk1.6.0_16/bin:$GRAILS_HOME/bin

# griffon
export GRIFFON_HOME=$HOME/coding/libs/griffon-latest
PATH=$PATH:$HOME/bin:$HOME/jdk1.6.0_16/bin:$GRIFFON_HOME/bin
PATH=${PATH}:$HOME/coding/libs/android-latest/tools
PATH=$PATH:/usr/java/latest/bin

#gradle
PATH=${PATH}:$HOME/coding/libs/gradle-latest/bin

#maven
export M2_HOME=/usr/share/maven2
PATH=${PATH}:~/coding/apache-maven-2.2.1/bin

#spring roo
PATH=${PATH}:~/coding/libs/spring-roo-latest/bin

#gwt
PATH=${PATH}:~/coding/libs/gwt-latest

#msejf
export MSEJF_HOME=/home/ktoso/coding/xsolve/msejf_home/

# git achievements
export PATH="$PATH:~/coding/git-achievements"
alias git="git-achievements"


export PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
