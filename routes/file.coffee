
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
  console.log "Streaming #{filename}"
  fs.stat filename, (err, stats) ->
    if err
      res.writeHead 404, { "Content-Type": "text/html" }
      res.end "404 not found."
      console.log err
    else
      header =
        "Content-Type": "video/mp4"
        Connection: "keep-alive"
        "Cache-Control": "public"
        "Content-Disposition": "inline; filename=" + filename + ";"
        "Content-Transfer-Encoding": "binary"
        "Content-Length": stats.size + 1
        "Last-Modified": stats.mtime.toUTCString()
        "Transfer-Encoding": "chunked"

      stream = fs.createReadStream filename, { flags: "r", start: 0, end: stats.size }

      stream.on 'error', (err) ->
        console.log err

      res.writeHead 200, header
      stream.pipe(res)
