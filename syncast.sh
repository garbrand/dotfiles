#!/bin/sh

# Sync Podcasts to the SD Card called 'AUDI MEDIA'

# -rtvu: Recurse, preserve modification Times, Verbose, Update folders
# --delete: delete files that are in TARGET but not in SOURCE
# --progress: show per-file progress

function syncast {
	SOURCE="~/Music/iTunes/iTunes Media/Podcasts/"
	DEST="/Volumes/AUDI MEDIA/Music/Podcasts"
	
	rsync -rtvu --progress --delete $SOURCE $DEST
}