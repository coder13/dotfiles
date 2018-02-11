export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"
export PATH="$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="$PATH:$HOME/.nvm/versions/node/v5.10.0/bin"
export PATH="$PATH:$HOME/.rvm.bin" # Add RVM to PATH for scripting

export NVM_DIR="/home/caleb.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # THis loads nvm# Copyright (c) npm, Inc. And Contributors

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

setopt RM_STAR_WAIT
setopt CORRECT

export VISUAL=vim
export TERM=screen-256color-bce


autoload -U colors && colors
export PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

setopt

function extract()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# TMUX
if which tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux new-session -s $$)
fi

_trap_exit() {
  ~/.dotfiles/scripts/tmuxClean
}

trap '~/.dotfiles/scripts/tmuxClean' EXIT


export NVM_DIR="/home/caleb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem
export PATH=$PATH':/home/caleb/.gem/bin'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
