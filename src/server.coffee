fetch = require 'node-fetch'
express = require 'express'
url = require 'url'

API_URL = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?'
PORT = 3001

app = express()

app.use express.static 'build'

app.get '/proxy', (req, res) ->
  query = url.parse(req.url).query
  fetch(API_URL + query)
  .then (data) ->
    remaining = data.headers.get('X-RateLimit-Remaining')
    console.log 'X-RateLimit-Remaining', remaining
    data.json()
  .then (json) ->
    res.send json

app.listen PORT, =>
  console.log 'Server listening on ' + PORT
