#!/bin/sh
alias dm=docker-machine

# export DOCKER_HOST=tcp://192.168.99.100:2376
# export DOCKER_MACHINE_NAME=dev
# export DOCKER_TLS_VERIFY=1
# export DOCKER_CERT_PATH=/Users/garbrand/.docker/machine/machines/dev

# Set the ENV vars for connecting the Docker host to the Docker client:
function dm-env {
	eval "$(docker-machine env ${1:-"dev"})"
}

function docker-clean {
	docker rmi $(docker images -f "dangling=true" -q)
}
