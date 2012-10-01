fs = require 'fs'

{spawn} = require 'child_process'

run_program = (cmd, args) ->
  program = spawn cmd, args
  program.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  program.stdout.on 'data', (data) ->
    console.log data.toString()
  program.on 'exit', (code) ->
    callback?() if code is 0

brew_coffee = (args) ->
  run_program 'coffee', args

build = (callback) ->
  brew_coffee ['lib']

run = (callback) ->
  brew_coffee ['app.coffee']

test = (callback) ->
  run_program 'mocha', ['--compilers', 'coffee:coffee-script']

task 'build', 'Build lib/ coffeescript folders', ->
  build()

task 'run', 'Run the app.coffee', ->
  run()

task 'test', 'Run mocha tests', ->
  test()
