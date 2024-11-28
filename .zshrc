# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"

plugins=(
    fzf
    fzf-tab
    zsh-autosuggestions
    git
    colorize
    history
    aws
    web-search
    zsh-syntax-highlighting
    F-Sy-H
)

source $ZSH/oh-my-zsh.sh
export EDITOR=emacs

function sso {
  usage="
   Usage:
     If fzf is installed:
       sso
       (This will present an interactive list of profiles to choose from)

     If fzf is not installed:
       sso <PROFILE>
       (Replace <PROFILE> with the name of the AWS profile you want to use)

   Example:
     With fzf:    'sso'
     Without fzf: 'sso my-aws-profile'
  "

  if [[ -n "$1" ]]; then
    (aws configure list-profiles | grep -qw "$1") && profile="$1" || {echo "\"$1\" profile doesn't exist"; echo $usage; return 1}
  elif command -v fzf &> /dev/null; then 
    profile="$(aws configure list-profiles | fzf --height 40% --layout=reverse)"
  else
    echo "Install fzf or run command like: 'sso <PROFILE>'"
    echo $usage
    return 1
  fi

  if [[ -n "$profile" ]]; then
    aws sts get-caller-identity > /dev/null 2>&1 || aws sso login --profile "$profile"
    export AWS_DEFAULT_REGION=eu-west-2 && \
    export AWS_PROFILE="$profile" && \
    export CDK_DEFAULT_PROFILE="$profile"
  else
    echo "No profile selected"
  fi
}


# ------------ZSH fzf-tab ------------
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# It specifies the key to trigger a continuous completion (accept the result and start another completion immediately). It's useful when completing a long path.
zstyle ':fzf-tab:*' continuous-trigger '/'
enable-fzf-tab
