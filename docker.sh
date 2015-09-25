#!/bin/sh
alias dm=docker-machine

function denv {
	if [ -z "$1" ]; then
        DOCKERENV=dev
    else
        DOCKERENV=$1
    fi

	eval "$(docker-machine env $DOCKERENV)"
}
