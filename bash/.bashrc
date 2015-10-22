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

if [ -t 1 ]; then # fd 1 is tty
    stty stop ""
fi

