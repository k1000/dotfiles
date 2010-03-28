# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
GRAY='\e[0;37m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# Looks best on a black background.....
echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}\
${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"

#PS1="\\[\\033[01;32m\\]\\u@\\h \\[\\033[01;34m\\]\\W \\\$ \\[\\033[00m\\]"
PS1="\[\e[35;1m\]\W\$ \[\e[0m\]"
export CLICOLOR="yes"

set completion-ignore-case On
complete -cf sudo

#aliases
alias l="ls -l"
alias ..='cd ..'
alias ...='cd ../..'
alias runserver='/usr/bin/python manage.py runserver'
alias runshell='/usr/bin/python manage.py shell'
alias g='grep'
alias s='sudo'
alias mkdir='mkdir -p'
alias rmall='rm -rf'

extract () 
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# List the most recent files in a directory
lsnew()
{
	ls -lt ${1+"$@"} | head -20;
}

# Open a manpage in Preview, which can be saved to PDF
pman()
{
   man -t "${1}" | open -f -a /Applications/Preview.app
}

LS_COLORS='no=00:fi=00:di=01;32:ln=01;33:pi=40;32:so=01;32:do=01;32:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;30:*.tar=00:*.tgz=00:*.arj=00:*.taz=00:*.lzh=00:*.zip=00:*.z=00:*.Z=00:*.gz=00:*.bz2=00:*.deb=01;32:*.rpm=01;32:*.jpg=00;32:*.gif=00;32:*.bmp=00;32:*.ppm=00;32:*.tga=00;32:*.xbm=00;32:*.xpm=00;32:*.tif=00;32:*.png=00;32:*.mov=00;32:*.mpg=00;32:*.ogm=00;32:*.avi=00;32:*.fli=00;32:*.gl=01;32:*.dl=01;32:'; export LS_COLORS

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

if [ -f .profile ]; then
	. .profile
fi

# SSH Auto Completion of Remote Hosts
SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | egrep -v [0123456789]) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh  
