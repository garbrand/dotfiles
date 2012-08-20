#!/usr/bin/env node

require('coa').Cmd() // main (top level) command declaration
	.name(process.argv[1]) // set top level command name from program name
	.title('My awesome command line util') // title for use in text messages
	.helpful() // make command "helpful", i.e. options -h --help with usage message
	.opt() // add an option
		.name('version') // name for use in API
		.title('Version') // title for use in text messages
		.short('v') // short key: -v
		.long('version') // long key: --version
		.flag() // for options without value
		.act(function(opts) { // add action for option
			// return message as result of action
			return JSON.parse(require('fs').readFileSync(__dirname + '/package.json'))
			.version;
		})
	.end() // end option chain and return to main command