#!/bin/sh

# Restart the library server
function restartlib {
	ssh -t informaat@library.informaat.net 'sudo /home/informaat/restart.sh'
}
