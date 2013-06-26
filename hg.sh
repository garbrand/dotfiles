#!/bin/sh

# hgclose `branch`
# CLose the given branch, jump back to default branch

# hg update `branch` && hg commit -m 'Closing `branch`' --close-branch && hg update `default`

BRANCH=$1

# echo $BRANCH

hg update $BRANCH && hg commit -m 'Closing $BRANCH' --close-branch && hg update default