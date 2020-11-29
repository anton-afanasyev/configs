# [ -n "$SSH_AUTH_SOCK" ] && ln -fs $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock 
#export NPM_PACKAGES="$HOME/.npm-packages"
#export PATH="$NPM_PACKAGES/bin:$PATH"
#unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
#export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
#export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../tmux/aux.sh


PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

PS1_WDIR="[\[\033[1;32m\]\w\[\033[0m\]]"
PS1_USER="[\[\033[1;34m\]\u@\h\[\033[0m\]]"
PS1_TIME="[\[\033[1;34m\]\$(/bin/date +%H-%M-%S)\[\033[0m\]]"
PS1_SPCE="[\[\033[1;34m\]\$(~/configs/bash/freespace.sh 2> /dev/null)\[\033[0m\]]"
PS1_SIGN="\$( [ `whoami` != 'root' ] && echo '$' || echo '#' )"
#export PS1="\n┌${PS1_WDIR}─${PS1_SPCE}─${PS1_USER}\n└─${PS1_TIME}: "
export PS1="${PS1_TIME}─${PS1_WDIR}${PS1_SIGN} "

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias em='emacs -nw'
alias gst='git st'

if [ -t 1 ]; then # fd 1 is tty
    stty stop ""
fi

