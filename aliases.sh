
if [[ "$OSTYPE" == "darwin"* ]]; then

    function e {
        emacsclient -c -n -a emacs $@
    }

    bash_loc="$HOME/.zshrc"
fi

if [[ "$OSTYPE" == "msys" ]]; then
    emacs="emacs -q -l c:/Users/dylan.ritchings/AppData/Roaming/.emacs.d/init.el"
    emacs_server="C:/Users/dylan.ritchings/scoop/apps/emacs/28.2/bin/.emacs.d/server/server"

    function e {
        # powershell "${emacs_client} -c -n -a emacs ${1}"
        emacsclient -f $emacs_server -c -n -a emacs $@
        # emacsclient -n "$@" &
        #powershell emacsclient -f $emacs_server -c -n -a "$($emacs)" .
    }

    bash_loc="$HOME/.bashrc"
fi
##powershell emacs -q -l c:/Users/dylan.ritchings/AppData/Roaming/.emacs.d/init.el
##powershell emacsclient -c -n -a "$(emacs -q -l c:/Users/dylan.ritchings/AppData/Roaming/.emacs.d/init.el)" .

##powershell emacsclient -c -n -a "$($emacs)" .



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

alias py="python"
alias python="python"
alias pip="pip"


#EMACS

function ef {
    $emacs -n $(fzf)
}

function ec {
    $emacs -n $1
}

#FZF

function cdf {
    local path="$(find . -print | fzf)"
    if [[ -f $path ]]; then
        path="$(dirname $path)/"
    fi
    cd $path
}

function dev {
    cd ~/Dev/
    local path="$(find . -print | fzf)"
    if [[ -f $path ]]; then
        path="$(dirname $path)/"
    fi
    cd $path
}

function rep {
    cd ~/Dev/Repos/
    local path="$(find . -print | fzf)"
    if [[ -f $path ]]; then
        path="$(dirname $path)/"
    fi
    cd $path
}
