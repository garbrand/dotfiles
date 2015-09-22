#!/bin/bash
function folder {
	# Echo the name of the current directory to stdout.
	# Given the directory is /Users/Garbrand/somewhere,
	# this command will echo `somewhere`
	printf '%s\n' "${PWD##*/}"
}
