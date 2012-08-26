var Media = require('../lib/media')

var assert = require("assert")
describe('Media', function(){
  describe('#folder()', function(){
    it('should have a path name', function() {
      var media = new Media();//'/usr/local/media/keynote.mp4')
      assert.equal('/usr/local/media', media.folder())
    })
  })
})
