#!/bin/sh

# Sonar Runner
function sonar {
	SONAR_RUNNER_OPTS="-Xmx1024m -XX:MaxPermSize=512m" /Users/Garbrand/tmp/sonar-runner-2.3/bin/sonar-runner	
}

# function sonar {
# 	PROJECT="both"
# 	DIR=`pwd`

# 	# Test for arguments
# 	if [ -z "$1" ]
# 	then
#     	echo `date`": No project supplied, testing both client and server"
# 	else
# 		PROJECT=$1
# 		echo `date`": Setting project to $PROJECT"
# 	fi

# 	# Set the proper config
# 	cp $DIR/sonar-project.properties.$PROJECT $DIR/sonar-project.properties
	
# 	# Run the analysis
# 	SONAR_RUNNER_OPTS="-Xmx512m -XX:MaxPermSize=128m" /Users/Garbrand/tmp/sonar-runner-2.3/bin/sonar-runner
	
# 	# Clear the config
# 	rm $DIR/sonar-project.properties
# }


# Sonar Server (with console):
function sonar-server {
	/Users/Garbrand/tmp/sonar-3.7/bin/macosx-universal-64/sonar.sh console
}
