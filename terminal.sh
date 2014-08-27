#!/bin/sh

function tabname {
	# directory = ${PWD##*/}
  printf "\e]1;$1\a"
}
 
function winname {
  printf "\e]2;$1\a"
}