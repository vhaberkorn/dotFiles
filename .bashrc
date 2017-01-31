# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)


## ALIASES
alias ll='ls -lah --color=auto'
alias la='ls -A'
alias l='ls -CF'

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
#copied from ParrotOS' bash
PS1='\[\033[0;31m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200")[\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\$\[\e[0m\] '

## TRANSFER.SH
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 
