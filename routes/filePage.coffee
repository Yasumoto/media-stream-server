
###
#   GET file html page
#   Joe Smith <yasumoto7@gmail.com>
#   October 2012
#   GPL or some such.
###

util = require 'util'

exports.filePage = (req, res) ->
  filename = '/movies/' + req.params[0]
  util.log "Serving up: " + filename
  res.render 'file', { videoFile: filename }
