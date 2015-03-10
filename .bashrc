export LS_COLORS=ExFxCxDxBxegedabagacad

# check syntax
alias pycheck='python -m py_compile'
alias pys='python -m SimpleHTTPServer'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias gm='gfms -a -p 8070'
alias vi='vim'

alias gs='git status'
alias gp='git pull'

alias cdwc='cd ~/code'

alias nmgrep="grep --exclude-dir=node_modules --exclude-dir=ps_big --exclude-dir=.git --exclude '*.csv' --exclude '*.less' --exclude '*.css' -r"
alias killssh="ps -ef | grep 'ssh -f' | awk '{print $2}' | xargs kill"

alias deploytime='cd ~/code/fabulaws && git pull && workon ops'
clone-go() {
  if [[ -e ~/code/$1 ]]; then
    echo "link exists, cowardly failing to clone"
  else
    # probably won't exist
    rm -rf $GOPATH/src/github.com/Clever/$1
    git clone git@github.com:Clever/$1.git $GOPATH/src/github.com/Clever/$1
    gvm use 1.3
    ln -s $GOPATH/src/github.com/Clever/$1 ~/code/$1
    gvm use 1.4
    ln -s ~/code/$1 $GOPATH/src/github.com/Clever/$1
  fi
}
smush() {
  msg=`git log --format=%B -n 1 HEAD`
  git reset --soft HEAD~1
  git commit -m $msg
}

clear-keygen() {
 fab instances:$1 | grep vpc | awk '{print $9}' | xargs -IX ssh-keygen -R X
}
