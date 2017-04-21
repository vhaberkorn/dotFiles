# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

## HISTORY
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=99999

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## ALIASES
alias ll='ls -lah --color=auto'
alias l='ls -lh --color=auto'
alias ..='cd ..'
alias cls='clear'
alias ethRestart='ifconfig eth0 down; ifconfig eth0 up'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
#alias msfconsole='msfconsole -d db_connect -y /opt/framework/config/database.yml'
alias msfconsole='msfconsole -d db_connect -y /usr/share/metasploit-framework/config/database.yml'


## EXTRACT
extract () {
if [ -f $1 ] ; then
    case $1 in
  *.tar.bz2)     tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
  *.tar.gz)     tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
  *.tar.xz)     tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
  *.bz2)          bunzip2 $1 && cd $(basename "$1" /bz2) ;;
  *.rar)          unrar x $1 && cd $(basename "$1" .rar) ;;
  *.gz)          gunzip $1 && cd $(basename "$1" .gz) ;;
  *.tar)          tar xvf $1 && cd $(basename "$1" .tar) ;;
  *.tbz2)          tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
  *.tgz)          tar xvzf $1 && cd $(basename "$1" .tgz) ;;
  *.zip)          unzip $1 && cd $(basename "$1" .zip) ;;
  *.Z)          uncompress $1 && cd $(basename "$1" .Z) ;;
  *.7z)          7z x $1 && cd $(basename "$1" .7z) ;;
  *)          echo "don't know how to extract '$1'..." ;;
    esac
else
    echo "'$1' is not a valid file!"
fi
}

## PS1
#copied from ParrotOS' bash and tuned by RTFM[Oi*]
PS1='\[\033[0;31m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200")[\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\033[0;31m\](\D{%T %F}) \[\e[01;30m\]\$\[\e[0m\] '

## TRANSFER.SH
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

## TERMBIN
alias termbin='nc termbin.com 9999'

### BASE CONVERSION
h2d(){ echo "ibase=16; $@" | bc; }
d2h(){ echo "obase=16; $@" | bc; }

## EXTERNAL IP
alias external_ip='curl -s http://ipinfo.io/ip'

## TEST INTERNET CONNECTION
# needs python and speedtest-cli 
test_net(){
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "IPv4 is up"
  if ping -q -c 1 -W 1 google.com >/dev/null; then
        echo "DNS is responding"
  else
    echo "DNS is not responding"
  fi
  case "$(curl -s --max-time 2 -I http://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) echo "HTTP connectivity is up";;
  5) echo "The web proxy won't let us through";;
  *) echo "The network is down or very slow";;
  esac
  echo "Testing speed..."
  speedtest-cli --simple
else
  echo "IPv4 is down"
fi
}

