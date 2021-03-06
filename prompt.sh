#!/bin/sh

source ${HOME}/.dotfiles/constants.sh


function git_color {
    local git_status="$(git status 2> /dev/null)"

    [[ $git_status == *"working directory clean"* ]] && local git_dirty=true;


  if [[ $git_status == *"Not a git repository"* ]]; then
    echo -e "$_GREY"
    # Red background, white text
    # echo -e "$(tput setab 1)$(tput setaf 7)"
  elif [[ $git_status == *"Your branch is ahead of"* ]]; then
    echo -e "$_YELLOW"
    # Yellow background, black text
    # echo -e "$(tput setab 3)$(tput setaf 0)"
  elif [[ $git_status == *"nothing to commit"* ]]; then
    echo -e "$_GREEN"
    # Green background, white text
    # echo -e "$(tput setab 2)$(tput setaf 0)"
  # elif [[ ! $git_status == *"working directory clean"* ]]; then
  #   echo -e "$_RED"
  elif [[ $git_dirty ]]; then
    echo -e "$_RED"
  else
    # Some other status, for instance files that are not added
    echo -e "$_YELLOW"
  fi


  # if [[ $git_status =~ "fatal: Not a git repository" ]]; then
  #   echo -e "$_GREY"
  # elif [[ ! $git_status =~ "working directory clean" ]]; then
  #   echo -e "$_RED"
  #   # Red background, white text
  #   # echo -e "$(tput setab 1)$(tput setaf 7)"
  # elif [[ $git_status =~ "Your branch is ahead of" ]]; then
  #   echo -e "$_YELLOW"
  #   # Yellow background, black text
  #   # echo -e "$(tput setab 3)$(tput setaf 0)"
  # elif [[ $git_status =~ "nothing to commit" ]]; then
  #   echo -e "$_GREEN"
  #   # Green background, white text
  #   # echo -e "$(tput setab 2)$(tput setaf 0)"
  # else
  #   echo -e "$_GREY"
  # fi
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
PS1+="\$(git_color)"        # colors git status
PS1+=" ● \[$_RESET\]"
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$_BLUE\]\$\[$_RESET\] "   # '#' for root, else '$'
export PS1


# ●
# BLACK CIRCLE
# Unicode: U+25CF, UTF-8: E2 97 8F
