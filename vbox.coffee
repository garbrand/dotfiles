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
join      = require('join').create()

command   = arguments._[0]
machine   = arguments._[1]


puts = (error, stdout, stderr) ->
	# util.puts(stdout)
	console.log(stdout)
	
translate = (error, stdout, stderr) ->

	# Create an array item per line
	pairs = stdout.split('\n')

	# Create an key/value pair for each line
	temp = (pair.split(' ') for pair in pairs)
	# Remove the last item, as there is a trailing \n
	temp.pop()
	
	# Transform the array to an object
	list = []
	( list.push({name: item[0].slice(1,-1), id: item[1].slice(1,-1)}) ) for item in temp
	
	# console.log(list)
	format(list)
	
	
format = (list) ->
	# Formatted output:
	# ◉ | openldap.local
	# ◎ | solaris
	
	
	# output = (item.name for item in list)
	output = list.map (item) -> 
		"◎  #{item.name}"
	
	console.log(output.join("\n"))


help = () ->
	# `vbox`
	# List (running) machines, display help
	
	console.log('Utility script wrapping VirtualBox`s VBoxManage command.\n')
	console.log('Usage:')
	console.log('vbox                   Display help')
	console.log('vbox ls                List (running) machines')
	console.log('vbox start <machine>   Start the `machine`')
	console.log('vbox pause <machine>   Do a savestate of the `machine`')

	
list = (running) ->
	# `vbox ls`
	# List (running) machines

	# VBoxManage list runningvms
	if running
		exec('VBoxManage list runningvms', translate)
	else
		# VBoxManage list vms
		exec("VBoxManage list vms", translate)

	
start = (machine) ->
	# `vbox start <machine>`
	# Start the `machine`

	# VBoxManage startvm <machine> --type headless
	console.log("VM \"#{machine}\" is starting...")
	exec("VBoxManage startvm #{machine} --type headless", puts)
	
	
pause = (machine) ->
	# vbox pause <machine>
	# Do a savestate of the `machine`

	# VBoxManage controlvm <machine> savestate
	console.log("VM \"#{machine}\" is pausing...")
	exec("VBoxManage controlvm #{machine} savestate", puts)
	

switch command
	when 'ls', 'list' then list(machine)
	when 'start' then start(machine)
	when 'pause' then pause(machine)
	else help()
