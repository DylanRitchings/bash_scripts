bind 'TAB:menu-complete'
bind Space:magic-space

##CD

alias cdd='cd ~/dev/' 
alias cdr='cd ~/dev/repos'

##GIT

alias gp='git push origin'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -m'
alias gcane="git commit --amend --no-edit"
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

##fzf
alias dev="fzf "

##

alias charm="pycharm64 &"

alias src="source ~/.bashrc"

alias code="code -r"

function e {
    C:/Users/dylan.ritchings/scoop/apps/emacs/current/bin/emacsclientw.exe -c -n -a C:/Users/dylan.ritchings/scoop/apps/emacs/current/bin/runemacs.exe $1
}

function ec {
    C:/Users/dylan.ritchings/scoop/apps/emacs/current/bin/emacsclientw.exe -n $1
}
function sw {
    export AWS_PROFILE=$1
}

export MSYS=enable_pcon
