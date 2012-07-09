var walk = require('walk');

var media = exports;

media.findMediaFiles = function (rootPath) {
  var files = [];
  var walker = walk.walk(rootPath, { followLinks: false });

  walker.on('file', function(root, stat, next) {
    //Add this file to the list of files
    files.push(root + '/' + stat.name);
    next();
  });

  walker.on('end', function() {
    console.log(files);
  });
}
