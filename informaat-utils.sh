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
		ssh -i /Users/Garbrand/Projects/ipe/ops/ansible/keys/id_rsa.silo informaat@$SILO.informaat.net -t byobu-screen
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

# Re-deploy a branch
function redeploy {
	if [ "$#" -ne 1 ]
	then
		echo "Usage: redeploy <branch name>"
	else
		ssh jenkins@hudson.informaat.net -t /var/lib/jenkins/bin/nave use 0.10.13 fleet-deploy --repo $1 --branch $1
	fi
}

# Reboot dashboard
function redash {
	ssh pi@dash1.local sudo reboot
	ssh pi@dash2.local sudo reboot
}