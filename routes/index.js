
/*
 * GET home page.
 */

var media = require('../lib/media.js');

exports.index = function(req, res){
  res.render('index', { title: 'Express' })
  media.findMediaFiles('/usr/local/Media');
};
