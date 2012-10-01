mocha = require 'mocha'
should = require('chai').should()

{Media} = require('../lib/media')

describe 'Media', () ->
  describe '#folder()', () ->
    it 'should have a path name', () ->
      media = new Media()  #'/usr/local/media/keynote.mp4'
      media.folder().should.be.a 'string'
      media.folder().should.equal '/usr/local/media'
