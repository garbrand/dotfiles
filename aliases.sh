#!/bin/sh

# Aliases
alias lls='ls -alh'
alias foundation='ssh root@37.153.96.178'
alias jag='ag --ignore node_modules --ignore components'
alias updatedb='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'
alias nosleep='pmset noidle'
alias chrome='open -a /Applications/Google\ Chrome.app/ $1'
alias cower='GIT_SSL_NO_VERIFY=true bower'
alias sizes='sudo du -xhd 1'
alias prod='NODE_CONFIG='{"ldapclient":{"url":"ldap://127.0.0.1:3891","runLocal":"true","dump":"/Users/garbrand/Projects/Dialogica/server/var/ldap/ldapdumpdev"}}' NODE_ENV=production npm start'
