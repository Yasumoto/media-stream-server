
###
#   GET file
#   Joe Smith <yasumoto7@gmail.com>
#   October 2012
#   GPL or some such.
###

util = require 'util'
fs = require 'fs'

exports.fileServing = (req, res) ->
  filename = '/' + req.params[0]
  fs.stat filename, (err, stats) ->
    if err
      res.writeHead 404
      res.end "404 not found."
      console.log err
    else
      header = {
        "Content-Type": "video/mp4",
        "Cache-Control": "public",
        Connection: "keep-alive",
        "Content-Disposition": "inline; filename=" + filename + ";",
        "Content-Transfer-Encoding": "binary",
        "Content-Length": stats.size
      }
      stream = fs.createReadStream filename, { flags: "r", start: 0, end: stats.size }

      stream.on 'error', (err) ->
        console.log err

      res.writeHead 200, header
      stream.pipe(res)
