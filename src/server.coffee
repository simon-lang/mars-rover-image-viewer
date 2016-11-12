express = require 'express'
bodyParser = require 'body-parser'
fetch = require 'node-fetch'
qs = require 'qs'

API_KEY = process.env.NASA_API_KEY or 'DEMO_KEY' # temp default for convinience
API_URL = 'https://api.nasa.gov/mars-photos/api/v1/rovers/'
PORT = 3001

unless API_KEY
  console.log 'Set NASA_API_KEY environment variable to use this server. e.g. DEMO_KEY.'
  process.exit()

app = express()
app.use bodyParser.json()

app.use express.static 'build'

app.post '/proxy', (req, res) ->

  # console.log 'body', req.body
  query = qs.stringify
    api_key: API_KEY
    earth_date: req.body.date
    camera: req.body.camera

  endpoint = API_URL + req.body.rover.toLowerCase() + '/photos?' + query
  console.log 'fetching', endpoint

  fetch(endpoint)
  .then (data) ->
    remaining = data.headers.get('X-RateLimit-Remaining')
    console.log 'RateLimit Remaining:', remaining
    data.json()
  .then (json) ->
    res.send json
  .catch (err) ->
    res.status(500).send 'Error fetching images'

app.listen PORT, ->
  console.log 'Server listening on ' + PORT
