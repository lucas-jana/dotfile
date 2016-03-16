### Custom Coloring ###
# custom prompt #
PS1="\[\033[0;36m\][\h:\[\033[33m\]\w\[\033[36m\]]\[\033[32m\] \u\$\n\[\033[37m\]"

#colors for ls
export CLICOLOR=1

export LSCOLORS=bxfxDxdxcxegedagagacad

### aliases ###
alias pyclean="find . -name '*.pyc' -delete"

alias agi="ag -i --context"

alias fname="find . -name"

alias krak_ip="fab tasks.update_local_ip"

alias java6="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/java"

alias "do_camus"="sudo /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/java -cp target/camus-tools-* com.linkedin.camus.etl.kafka.CamusJob -P camus.properties"

alias "do_hadoop"="sudo /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/java -cp target/hadoop-jobs-*"

alias zookeep="~/gitstuff/kafka-0.7.2-incubating-src/bin/zookeeper-server-start.sh ~/gitstuff/kafka-0.7.2-incubating-src/config/zookeeper.properties"

alias penal_colony="~/gitstuff/kafka-0.7.2-incubating-src/bin/kafka-server-start.sh ~/gitstuff//kafka-0.7.2-incubating-src/config/server.properties"

alias rrm="~/.bin/trashit"

alias emacs=/usr/local/opt/emacs/bin/emacs-24.4

### history stuff ###
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export PATH="$HOME/.cask/bin:$PATH"
source ~/git-completion.bash

### a few bash completion stuff taken from https://github.com/mathiasbynens/dotfiles ###
# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
    fi;

### custom functions ###
function swap()
{
    tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
    mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
    }

### Path stuff ###
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# android SDK
export PATH=$PATH:/Users/lmorduch/Library/Android/sdk/platform-tools/

# macports addition
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# scalding/scala
export SCALA_HOME=~/gitstuff/scala
export PATH=$PATH:$SCALA_HOME/bin
export HADOOP_CLASSPATH=~/gitstuff/analytics/scalding_jobs/target/scala-2.11/jana_scalding_jobs-assembly-1.1.jar

### pyenv stuff ###
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# java home
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home"

# Jana specific
export JANAENV='development'
