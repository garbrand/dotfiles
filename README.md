# Local dotfiles

I've pushed out my dotfiles so I can share them across machines.

## TODO
 - clean out the structure, load the files automatically
 - bring `.bashrc` and `.profile` stuff into dotfiles

Current `.profile`:

	PS1="⚡ \[\033[1;34m\]\h:\[\033[0m\] \W \$ "
	
	# Aliases
	alias lls='ls -alh'


	# Pull in some shortcuts
	source ~/.dotfiles/virtualbox
	source ~/.dotfiles/databases
	source ~/.dotfiles/teamcity
	source ~/.dotfiles/node
	source ~/.dotfiles/mercurial
	source ~/.dotfiles/jira
	source ~/.dotfiles/maqetta
	source ~/.dotfiles/joyent
