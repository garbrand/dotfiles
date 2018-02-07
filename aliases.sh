#!/bin/sh

# Aliases
alias lls='ls -alh'
alias jag='ag --ignore node_modules --ignore components'
alias updatedb='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'
alias nosleep='pmset noidle'
alias chrome='open -a /Applications/Google\ Chrome.app/ $1'
alias sizes='sudo du -xhd 1'
alias ports='sudo lsof -PiTCP -sTCP:LISTEN'
