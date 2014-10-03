if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

ssh-add

source ~/bin/git-completion.bash

export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/bin:/usr/local/go/bin:~/go/bin
export ZSH=~/bin/oh-my-zsh

export CLICOLOR=1

VENV_WRAPPER=/usr/local/bin/virtualenvwrapper.sh

if [ -f "$VENV_WRAPPER" ]
then
    source $VENV_WRAPPER
fi

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
source /usr/local/bin/virtualenvwrapper.sh
