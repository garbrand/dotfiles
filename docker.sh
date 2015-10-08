#!/bin/sh
alias dm=docker-machine

# export DOCKER_HOST=tcp://192.168.99.100:2376
# export DOCKER_MACHINE_NAME=dev
# export DOCKER_TLS_VERIFY=1
# export DOCKER_CERT_PATH=/Users/garbrand/.docker/machine/machines/dev

# Set the ENV vars for connecting the Docker host to the Docker client:
function dm-env {
	if [ -z "$1" ]; then
        DOCKERENV=dev
    else
        DOCKERENV=$1
    fi

	eval "$(docker-machine env $DOCKERENV)"
}

# Attempt to set docker variables:
dm-env
