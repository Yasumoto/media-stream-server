
###
 * GET home page.
###

walk = require 'walkdir'
mime = require 'mime'
path = require 'path'

exports.index = (req, res) ->
  emitter = walk process.env.SERVING_DIRECTORY || "."
  movieFiles = []
  emitter.on 'file', (filename, stat) ->
    if mime.lookup(filename) is 'video/mp4'
      pathname = path.basename filename
      linkname = encodeURIComponent path.relative process.env.SERVING_DIRECTORY, filename
      movie = { name: pathname, linkname: linkname }
      movieFiles.push movie
  emitter.on 'end', () ->
    res.render 'index', { files: movieFiles }
