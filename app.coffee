express       = require 'express'
http          = require 'http'
routes        = require './routes'
{fileServing} = require './routes/file'
{filePage}    = require './routes/filePage'
path          = require 'path'
util          = require 'util'

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'ejs'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use require('less-middleware')({ src: __dirname + '/public' })
  app.use express.static(path.join(__dirname, 'public' ))
  app.use express.static process.env.SERVING_DIRECTORY

app.configure 'development', () ->
  app.use express.errorHandler()

app.get '/', routes.index
#app.get '/link/*', filePage
#app.get '/movies/*', fileServing
app.get '/quitquitquit', (req, res) ->
  res.end 'peace out'
  util.log 'exiting via /quitquitquit'
  process.exit()

http.createServer(app).listen app.get('port'), () ->
  console.log 'Express server listening on port ' + app.get('port')
