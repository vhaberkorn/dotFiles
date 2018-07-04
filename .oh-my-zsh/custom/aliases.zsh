# *NIX
alias du='du -kh --max-depth=1'
alias df='df -h' 
alias cls='clear'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ZSH
alias zshconfig="vim ~/.zshrc"
alias reloadzsh="source ~/.zshrc && echo 'Zsh Reloaded!'"

alias gpg_help="echo 'Create keys:   		gpg --full-gen-key\nExport public key:	gpg --export  -a <user-id>\nImport public key:	gpg --import <pub.key>\nEncryption: 		gpg -r <user-id> -e <file>\nDecryption:		gpg -d <file.gpg>\nSign: 			gpg -s <file>\nVerify:			gpg --verify <file.sig>\n'"


# Docker
alias stop_and_kill_dockers='sudo docker stop $(sudo docker ps -aq) && sudo docker rm $(sudo docker ps -aq)'

# OpenVPN
alias start_pia='sudo cd /etc/openvpn/client; sudo openvpn Brazil.ovpn'
