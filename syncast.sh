#!/bin/sh

# Sync Podcasts to the SD Card called 'AUDI MEDIA'

# -rtvu: Recurse, preserve modification Times, Verbose, Update folders
# --delete: delete files that are in TARGET but not in SOURCE
# --progress: show per-file progress

function syncast {
	SOURCE="/Users/Garbrand/Music/iTunes/iTunes Media/Podcasts/"
	DEST="/Volumes/AUDI MEDIA/Music/Podcasts/"

	if [ -d "$DEST" ]
	then 
		# rsync -rtvu --progress --delete "$SOURCE "$DEST"
		# rsync -rtvu --progress --delete /Users/Garbrand/Music/iTunes/iTunes\ Media/Podcasts/ /Volumes/AUDI\ MEDIA/Music/Podcasts/
		rsync -rtvu --progress /Users/Garbrand/Music/iTunes/iTunes\ Media/Podcasts/ /Volumes/AUDI\ MEDIA/Music/Podcasts/
	else
		echo "Could not find destination directory $DEST"
	fi
}
