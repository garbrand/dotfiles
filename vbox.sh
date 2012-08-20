#!/bin/bash

# Helper script wrapping around VirtualBox commands

if [ -z "$1" ]; then
	echo 'usage: vbox [virtual image name] [option]'
	echo ''
	echo 'Options:'
	echo '-p pause'
	echo '-r resume'
	echo '-s stop'
	echo '-g go'
	echo '-l list machines'
	echo '-a list running machines'
fi

while getopts ":aglprs" optname
	do
	case "$optname" in
		"a")
			echo "Running VMs:"
			VBoxManage list runningvms
		;;
		"g")
			VBoxManage startvm "Debian AMD64" --type headless
		;;
		"l")
			echo "Available VMs:"
			VBoxManage list vms
		;;
		"p")
			VBoxManage controlvm "Debian AMD64" pause
		;;
		"r")
			VBoxManage controlvm "Debian AMD64" resume
		;;
		"s")
			echo "Debian AMD64"
			VBoxManage controlvm "Debian AMD64" savestate
		;;
		"?")
			echo "Unknown option $OPTARG"
		;;
	esac
done