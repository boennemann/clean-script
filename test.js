'use strict'

var nixt = require('nixt')
var test = require('tape')

function handleError (t) {
  t.plan(1)
  return function (err) {
    if (err) return t.fail(err.message)
    t.pass('stdout is ok')
  }
}

test('executes command and exit', function (t) {
  nixt()
  .run('./bin/clean-script \'echo "close"\' \'echo "cleanup"\'')
  .stdout('close\ncleanup')
  .end(handleError(t))
})

test('executes exit even when command fails', function (t) {
  nixt()
  .run('./bin/clean-script \'echo "error" && exit 1\' \'echo "cleanup"\'')
  .stdout('error\ncleanup')
  .end(handleError(t))
})

test('executes multiples exits in right order', function (t) {
  nixt()
  .run('./bin/clean-script \'echo "close"\' \'echo "cleanup1"\' \'echo "cleanup2"\'')
  .stdout('close\ncleanup1\ncleanup2')
  .end(handleError(t))
})
