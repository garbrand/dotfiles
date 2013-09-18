#!/bin/sh

function hgfetch {
	hg pull
	hg update
}


function hgsync {
	if [ "$(hg branch)" != "release" ]; then
		hg pull
		hg up
		hg merge release
		hg commit -m 'Merged with release'
	else
		echo 'You are on release, nothing to merge'
	fi
}


function hgclose {
	# if no argument was passed, display help
	
	# hgclose `branch`
	# Close the given branch, jump back to release

	BRANCH=$1

	hg update $BRANCH
	hg commit -m "Closing branch: $BRANCH" --close-branch
	hg update release
}