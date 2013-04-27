
function parse_git_branch {
  ref=$(git rev-parse --abbrev-ref HEAD 2> /dev/null) || return
  remote=$(git remote -v | grep "origin.*push" | sed -r -e "s/^.*\/([a-z0-9_-]*)\.git.*/\1/i" -)
    echo " ("${remote}/${ref#refs/heads/}")"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
STOP="\[\033[0;00m\]"

PS1="[\u@\h \W]$YELLOW\$(parse_git_branch)$STOP\$ "

export PAGER=less

export PATH="$PATH:~/bin"
