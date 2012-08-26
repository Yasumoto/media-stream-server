pathname = ""

Media = () ->
  if not this instanceof Media
    return new Media()

Media.prototype.folder = () ->
  return "test"

module.exports = Media
