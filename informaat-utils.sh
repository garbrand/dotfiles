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
		exit 1
	fi

	SILO=$1
	ssh -i ~/Projects/ipe/ops/ansible/keys/id_rsa.silo informaat@$SILO.informaat.net -t byobu-screen
}
