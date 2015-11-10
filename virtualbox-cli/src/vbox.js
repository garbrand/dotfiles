#!/usr/bin/env node

var args, command, exec, format, help, join, list, machine, pause, puts, start, translate;

exec = require('child_process').exec;
args = require('optimist').argv;
join = require('join').create();

command = args._[0];

machine = args._[1];

puts = function(error, stdout, stderr) {
  console.error(stderr);
  return console.log(stdout);
};

translate = function(error, stdout, stderr) {
  var i, item, len, list, pair, pairs, temp;
  pairs = stdout.split('\n');
  temp = (function() {
    var i, len, results;
    results = [];
    for (i = 0, len = pairs.length; i < len; i++) {
      pair = pairs[i];
      results.push(pair.split(' '));
    }
    return results;
  })();
  temp.pop();
  list = [];
  for (i = 0, len = temp.length; i < len; i++) {
    item = temp[i];
    list.push({
      name: item[0].slice(1, -1),
      id: item[1].slice(1, -1)
    });
  }
  return format(list);
};

format = function(list) {
  var output;
  output = list.map(function(item) {
    return "◎  " + item.name;
  });
  return console.log(output.join("\n"));
};

help = function() {
  console.log('Utility script wrapping VirtualBox`s VBoxManage command.\n');
  console.log('Usage:');
  console.log('vbox                   Display help');
  console.log('vbox ls                List (running) machines');
  console.log('vbox start <machine>   Start the `machine`');
  return console.log('vbox pause <machine>   Do a savestate of the `machine`');
};

list = function(running) {
  if (running) {
    return exec('VBoxManage list runningvms', translate);
  } else {
    return exec("VBoxManage list vms", translate);
  }
};

start = function(machine) {
  console.log("VM \"" + machine + "\" is starting...");
  return exec("VBoxManage startvm " + machine + " --type headless", puts);
};

pause = function(machine) {
  console.log("VM \"" + machine + "\" is pausing...");
  return exec("VBoxManage controlvm " + machine + " savestate", puts);
};

switch (command) {
  case 'ls':
  case 'list':
    list(machine);
    break;
  case 'start':
    start(machine);
    break;
  case 'pause':
    pause(machine);
    break;
  default:
    help();
}
