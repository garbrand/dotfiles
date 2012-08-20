#!/usr/bin/env coffee

# 
#  Virtual Box utility script
#  
#  Created by Garbrand van der Molen on 2012-07-17.
#  Copyright 2012 Informaat IPE BV. All rights reserved.
# 

util      = require('util')
exec      = require('child_process').exec
arguments = require('optimist').argv

command   = arguments._[0]
argument  = arguments._[1]

root = '/Users/GarbrandM/Projects/Phoenix'
modules = {
	api:
		branch: '...'
	design:
		branch: '...'
	client:
		branch: '...'
}

help = () ->
	# 'ipe'
	# Display help
	
	console.log('Utility script wrapping code versioning commands for IPE source code.\n')
	console.log('')
	
puts = (error, stdout, stderr) ->
	# util.puts(stdout)
	util.puts(stdout)

update = (error, stdout, stderr) ->
	console.log(stdout)
	
branch = (branch) ->
	switch branch
		when 'branch' then switchBranch(branch)
		else listBranch()
	
switchBranch = (branch) ->

hg = (command, module, callback) ->
	# Wrap the `hg` command
	exec("cd #{root}/#{module} && hg #{command} && cd ..", callback, cwd: '#{root}/#{module}')

listBranch = () ->
	# exec("cd #{root}/#{branch} && hg branch && cd ..", puts) for branch of modules
	hg('branch', module, update) for module of modules

switch command
	when 'branch' then branch(argument)
	else help()