#!/bin/sh

# Sync Podcasts to the SD Card called 'AUDI MEDIA'

# -rtvu: Recurse, preserve modification Times, Verbose, Update folders
# --delete: delete files that are in TARGET but not in SOURCE
# --progress: show per-file progress

rsync -rtvu --progress --delete ~/Music/iTunes/iTunes\ Media/Podcasts/ /Volumes/AUDI\ MEDIA/Music/Podcasts