
###
 * GET home page.
###

walk = require 'walkdir'
mime = require 'mime'

exports.index = (req, res) ->
  emitter = walk process.env.SERVING_DIRECTORY || "."
  movieFiles = []
  emitter.on 'file', (filename, stat) ->
    if mime.lookup(filename) is 'video/mp4'
      movieFiles.push filename
  emitter.on 'end', () ->
    console.log movieFiles
    res.render 'index', { files: movieFiles }
