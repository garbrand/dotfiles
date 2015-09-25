#!/bin/sh

function tabname {
    # Set the tabname, if no argument given, to the current folder
    if [ -z "$1" ]; then
        FOLDER=$(folder)
    else
        FOLDER=$1
    fi

	# directory = ${PWD##*/}
  printf "\e]1;$FOLDER\a"
}

function winname {
  printf "\e]2;$1\a"
}

function folder {
	# Echo the name of the current directory to stdout.
	# Given the directory is /Users/Garbrand/somewhere,
	# this command will echo `somewhere`
	printf '%s\n' "${PWD##*/}"
}
