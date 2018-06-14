alias du='du -kh --max-depth=1'
alias df='df -h' 
alias cls='clear'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Docker
alias stop_and_kill_dockers='sudo docker stop $(sudo docker ps -aq) && sudo docker rm $(sudo docker ps -aq)'

# OpenVPN
alias start_pia='sudo cd /etc/openvpn/client/normal/; sudo openvpn Brazil.ovpn'

