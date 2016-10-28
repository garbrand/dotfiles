#!/bin/sh

# Aliases
alias lls='ls -alh'
alias jag='ag --ignore node_modules --ignore components'
alias updatedb='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'
alias nosleep='pmset noidle'
alias chrome='open -a /Applications/Google\ Chrome.app/ $1'
alias sizes='sudo du -xhd 1'
alias prod='NODE_CONFIG='{"ldapclient":{"url":"ldap://127.0.0.1:3891","runLocal":"true","dump":"/Users/garbrand/Projects/Dialogica/server/var/ldap/ldapdumpdev"}}' NODE_ENV=production npm start'
alias sshops="/Users/garbrand/Projects/cxp-ops/ops/bin/ssh_into_opscentre.sh"
alias talkway="ssh -i ~/.ssh/AWS-key-pair.pem ec2-user@52.57.162.170"
alias youtrack="ssh -i ~/.ssh/AWS-key-pair.pem ec2-user@52.57.239.26"
