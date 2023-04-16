
if [[ "$OSTYPE" == "darwin"* ]]; then
    emacs_location=""
    bash_loc="$HOME/.zshrc"
fi

if [[ "$OSTYPE" == "windows"* ]]; then
    emacs_locations=""
    bash_loc="$HOME/.bashrc"
fi


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


## OTHER
alias charm="pycharm64 &"

alias src="source $bash_loc"

alias code="code -r"

## PYTHON

alias py="python3"
alias python="python3"
alias pip="pip3"


#EMACS

function e {
    emacs $1
}

function ef {
    emacsclient -n $(fzf)
}

function ec {
    emacsclient -n $1
}


#FZF

function cdf {
    cd $(find . -print | fzf)
}

function dev {
    cd ~/Dev/
    cd $(find . -print | fzf)
}



function rep {
    cd ~/Dev/Repos/
    cd $(find . -print | fzf)
}
