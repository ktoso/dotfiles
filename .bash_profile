# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# autojump (like z)
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

# --------------- java stuff --------------------------------------------

export IDEA_JDK=$JAVA_HOME

##
# Your previous /Users/ktoso/.bash_profile file was backed up as /Users/ktoso/.bash_profile.macports-saved_2011-12-30_at_17:31:30
##

# MacPorts Installer addition on 2011-12-30_at_17:31:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# rbenv
eval "$(rbenv init -)"

export PATH=/Applications/SenchaSDKTools-2.0.0-Beta:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Beta/bin:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Beta/jsbuilder:$PATH

PATH=/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin/:$PATH

# ec2 tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem 2> /dev/null | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem 2> /dev/null | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
