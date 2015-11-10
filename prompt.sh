#!/bin/sh

source ${HOME}/.dotfiles/constants.sh


function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    # echo -e "$_RED"
    echo -e "$(tput setab 1)$(tput setaf 7)"
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e "$_YELLOW"
  elif [[ $git_status =~ "nothing to commit" ]]; then
    # echo -e "$_GREEN"
    echo -e "$(tput setab 2)$(tput setaf 7)"
  else
    # echo -e "$_OCHRE"
    echo -e "$(tput setab 1)$(tput setaf 3)"
  fi
}


function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}


PS1="\[$_WHITE\]\n[\W]"          # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$_BLUE\]\$\[$_RESET\] "   # '#' for root, else '$'
export PS1
