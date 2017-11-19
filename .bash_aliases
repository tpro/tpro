complete -C "$(locate aws_completer)" aws

#
LS_COLORS=$LS_COLORS:'ow=00;38;5;208:' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'ow=30;41' ; export LS_COLORS ;

PATH=$PATH:~/.local/bin

#

# activate keyring capabilities
source ~/.config/i3/start-gnome-keyring.sh

ssha() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
     tmux rename-window "H:$(echo $* | cut -d . -f 1)"
     command ssh "$@"
     tmux set-window-option automatic-rename "on" 1>/dev/null
  else
     command ssh "$@"
  fi
}
ssht() { 
    ssh $* -t 'tmux a || tmux || /bin/bash' 
}

alias gst="git status"
alias open=xdg-open
alias notes="subl ~/Dropbox/NOTES.txt"

alias lks="sudo cryptsetup luksOpen ~tpro/Dropbox/2priv/priv-l.img trc && udisksctl mount --block-device /dev/mapper/trc "
# alias vcp="veracrypt -t --protect-hidden=no -k '' ~/Dropbox/1-priv/priv-tc.tc /media/truecrypt1/"
# alias vcw="veracrypt -t --protect-hidden=no -k '' ~/MEGA/workspace.vc /media/vc-workspace/"

alias ave="ansible-vault edit"
alias ava="rm ~/.ansible/open_the_vault.sh; ln -s ~/.ansible/open_the_vault-adm.sh ~/.ansible/open_the_vault.sh"
alias avd="rm ~/.ansible/open_the_vault.sh; ln -s ~/.ansible/open_the_vault-dev.sh ~/.ansible/open_the_vault.sh"

alias ducks="du -chs * | sort -rnh "
alias pss="ps --sort=-%mem,-pcpu axo comm,%mem,pcpu,stat"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias kolory='for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i}  "; done'

# alias memclr="sudo ~/bin/mem-clear.sh"
# alias moinha='mosh --ssh="ssh -p 10022" hastur.s.infakt.pl -p 60001'

# alias heidisql="cd ~/opt/heidisql ; wine heidisql ; cd -"
# alias warnjade="WINEARCH=win32 WINEPREFIX=~/.wine32 primusrun wine ~/WAR/RoRLauncher.exe"
# alias dvd2file="mencoder dvd://2 -ovc lavc -lavcopts vcodec=mpeg4:vhq:vbitrate=\"1200\" -vf scale -zoom -xy 640 -oac mp3lame -lameopts br=128 -o "


prjflask() {
    if [ $# -lt 2 ]
    then
        echo "Usage:"
        echo -e "prjflask <project directory> <virtualenv name>"
        return 1
    fi

    # Create a new window.
    tmux new-window -a -n "$2" -c "$1"

    # Send keys to the large pane on the left.
    tmux send-keys "workon $2" C-m
    tmux send-keys "git status" C-m

    # Split the window horizontally.
    tmux split-window -h -c "$1"

    # Send keys to the top right pane.
    tmux send-keys "workon $2" C-m
    tmux send-keys "xdg-open http://127.0.0.1:5000" C-m

    # Split the window again, this time vertically.
    tmux split-window -v -c "$1"

    # Send keys to the bottom right pane.
    tmux send-keys "workon $2" C-m
    tmux send-keys "python app.py" C-m
}

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ave="ansible-vault edit"
alias ava="rm ~/.ansible/open_the_vault.sh; ln -s ~/.ansible/open_the_vault-adm.sh ~/.ansible/open_the_vault.sh"
alias avd="rm ~/.ansible/open_the_vault.sh; ln -s ~/.ansible/open_the_vault-dev.sh ~/.ansible/open_the_vault.sh"
alias gst="git status"
alias gco="git checkout"

complete -C '/usr/bin/aws_completer' aws


