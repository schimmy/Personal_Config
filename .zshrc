# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="fino"
#ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile
# Customize to your needs...
#kinit

source ~/.bashrc

export WORKON_HOME="$HOME/working_code/virtualenv_environments"
source /usr/local/bin/virtualenvwrapper.sh

alias vi='vim'
alias ci='vim'
alias h='history'
alias pret='python -mjson.tool'
alias pgrep='ps -ef | grep'

alias ls='ls -Ga'
alias ll='ls -l'
alias ks='ls'


###########################################
#   iTerm Tab and Title Customization     #
###########################################

function set_title_tab {

function settab   {

# file settab  -- invoked only if iTerm or Konsole is running 

#  Set iterm window tab to current directory and penultimate directory if the
#  shell process is running.  Truncate to leave the rightmost $rlength characters.
#
#  Use with functions settitle (to set iterm title bar to current directory)
#  and chpwd


if [[ $TERM_PROGRAM == iTerm.app && -z "$KONSOLE_DCOP_SESSION" ]];then
#
# The $rlength variable prints only the 20 rightmost characters. Otherwise iTerm truncates
# what appears in the tab from the left.


# Chage the following to change the string that actually appears in the tab:

tab_label="$PWD:h:t/$PWD:t"

rlength="20"   # number of characters to appear before truncation from the left

echo -ne "\e]1;${(l:rlength:)tab_label}\a"


else  

# For KDE konsole tabs 

# Chage the following to change the string that actually appears in the tab:

tab_label="$PWD:h:t/$PWD:t"

rlength="20"   # number of characters to appear before truncation from the left

# If we have a functioning KDE console, set the tab in the same way
if [[ -n "$KONSOLE_DCOP_SESSION" && ( -x $(which dcop)  )  ]];then
dcop "$KONSOLE_DCOP_SESSION" renameSession "${(l:rlength:)tab_label}"
else
: # do nothing if tabs don't exist
fi    

fi
}

function settitle   {
# Function "settitle"  --  set the title of the iterm title bar. use with chpwd and settab

# Change the following string to change what appears in the Title Bar label:


    title_lab=$HOST:r:r::$PWD  
# Prints the host name, two colons, absolute path for current directory

# Change the title bar label dynamically:

        echo -ne "\e]2;[zsh]   $title_lab\a"
}

# Set tab and title bar dynamically using above-defined functions

function title_tab_chpwd { settab ; settitle }

# Now we need to run it:
title_tab_chpwd

# Set tab or title bar label transiently to the currently running command

#HISTCMD=1

if [[ "$TERM_PROGRAM" == "iTerm.app" ]];then        
#function title_tab_preexec {  echo -ne "\e]1; $(history $HISTCMD | cut -b7- ) \a"  } 
#function title_tab_precmd  { settab }   
else
#function title_tab_preexec {  echo -ne "\e]2; $(history $HISTCMD | cut -b7- ) \a"  } 
#function title_tab_precmd  { settitle }      
fi


typeset -ga preexec_functions
preexec_functions+=title_tab_preexec

typeset -ga precmd_functions
precmd_functions+=title_tab_precmd

typeset -ga chpwd_functions
chpwd_functions+=title_tab_chpwd

}

####################

set_title_tab

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
