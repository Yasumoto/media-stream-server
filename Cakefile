fs = require 'fs'

child_process = require 'child_process'

brew_coffee = (args) ->
  coffee = child_process.spawn 'coffee', args
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    console.log data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

build = (callback) ->
  brew_coffee ['lib']

run = (callback) ->
  brew_coffee ['app.coffee']

task 'build', 'Build lib/ coffeescript folders', ->
  build()

task 'run', 'Run the app.coffee', ->
  run()
