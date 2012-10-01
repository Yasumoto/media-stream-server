
###
#   GET file
#   Joe Smith <yasumoto7@gmail.com>
#   October 2012
#   GPL or some such.
###

util = require 'util'
fs = require 'fs'

exports.fileServing = (req, res) ->
  header = {
    "Content-Type": "video/mp4"
  }
  res.writeHead 200, header
  filename = '/' + req.params[0]
  stream = fs.createReadStream filename, { flags: "r", start: 0 }
  stream.pipe(res)
