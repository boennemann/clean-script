'use strict'

var exec = require('child_process').exec

var execSync = require('execSync').exec
var exitHook = require('exit-hook')

module.exports = function(command) {
  var exits = Array.prototype.slice.call(arguments, 1)
  var child = exec(command, {
    cwd: process.cwd(),
    env: process.env
  })

  child.stderr.pipe(process.stderr)
  child.stdout.pipe(process.stdout)

  child.on('close', process.exit)
  child.on('error', process.exit)

  exitHook(function() {
    exits.forEach(function(exit) {
      var result = execSync(exit)
      process.stdout.write(result.stdout)
    })
    child.kill()
  })
}
