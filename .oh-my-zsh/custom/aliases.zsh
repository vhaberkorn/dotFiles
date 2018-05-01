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

