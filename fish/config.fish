
# [ -n "$SSH_AUTH_SOCK" ] && ln -fs $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock 
set -x NPM_PACKAGES "$HOME/.npm-packages"
set -x PATH $NPM_PACKAGES/bin $PATH
# set -e MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH
set -x NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH

set -x PATH $PATH /usr/local/go/bin
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# TODO: make tmux/aux.fish
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#source $DIR/../tmux/aux.sh



# fd 1 is tty
[ -t 1 ]; and stty stop ""


function em --description 'Emacs no X'
	emacs -nw $argv
end

function gst --description 'git status'
         git st
end

function fish_prompt --description 'Write out the prompt'
    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    set -l color_cwd
    set -l suffix
    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s '[' (set_color $color_cwd) (prompt_pwd) (set_color normal) "] $suffix "
end

function fish_right_prompt -d "Write out the right prompt"
  set -l exit_code $status

  set_color black

  # Print a red dot for failed commands.
  if test $exit_code -ne 0
    set_color red
    echo -n "• "
    set_color black
  end

  # Show duration of the last command in seconds it took more than 1 sec
  if test $CMD_DURATION -a $CMD_DURATION -ge 1000
    set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
    echo $duration
  end

  set_color normal
end
