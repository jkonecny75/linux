#
# ~/.bashrc
#

export PATH=$HOME/bin:$PATH
export JAVA_HOME=~/opt/java/jdk

parse_git_branch() {
     BRANCH_NAME=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/#\1/')
     echo "${BRANCH_NAME:0:20}"
}
export PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
