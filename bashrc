alias ll='ls --time-style="+%Y-%m-%d %H:%M:%S" -l'
#alias ll='ls --time-style="+%Y-%m-%d %H:%M:%S" -lt'
#alias ll='ls --time-style="+%Y-%m-%d %H:%M:%S" -ltr'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias www='cd /var/www'
alias pgs='ps -ef | grep postgres'
alias vi='vim'

export PS1='[\[\e[01;32m\]\u@\h\[\e[00m\] : \[\033[01;34m\]\w\[\e[00m\]]\n% '
export PS1='[\[\e[01;32m\]\u@\h\[\e[00m\] : \[\033[01;34m\]\w \[\e[01;31m\]\D{%G-%m-%d} \t \[\e[01;36m\]\#\[\e[00m\]]\n% '

export PG=$HOME/HOME2/postgresql
export PGDATA=$HOME/HOME2/postgresql/data
export PGDATABASE=postgres

export PATH=$PATH:$PG/bin
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

alias ssh10005='ssh -p 10005 root@172.21.70.159'
alias ssh10004='ssh -p 10004 root@172.21.70.159'

#find . -name '*.html' -exec rm {} \;
#find . ! -name '*.jpg' ! -name '*.png' ! -type d -exec rm {} \;

