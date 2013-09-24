#!/bin/sh

# Restart the library server
function restartlib {
	ssh -t informaat@library.informaat.net 'sudo /home/informaat/restart.sh'
}

# Manage a silo
function manage {
	if [ "$#" -ne 1 ]
	then
		echo "Usage: manage <silo name>"
	else
		SILO=$1
		ssh -i ~/Projects/ipe/ops/ansible/keys/id_rsa.silo informaat@$SILO.informaat.net -t byobu-screen
	fi
}

# Delete a story branch from Hudson
function delBranch {
	if [ "$#" -ne 1 ]
	then
		echo "Usage: delBranch <branch name>"
	else
		BRANCH=$1
		curl -d '' http://rohann:4b29eba4db6c2fb9c98bdf4a171f8ab5@192.168.13.102:8080/job/$BRANCH/doDelete
	fi
}
