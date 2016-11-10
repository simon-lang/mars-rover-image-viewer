sinon = require('sinon')
chai = require('chai')
assert = chai.assert

hasCamera = (rover, camera) ->
  (camera.rovers | rover.flag) is camera.rovers

cameras = require '../src/enums/cameras'
rovers = require '../src/enums/rovers'

mockConsole =
  log: (a, b) ->

app = null
spy = null

describe 'app', ->
  beforeEach ->
    spy = sinon.spy(mockConsole, 'log')

  afterEach ->
    mockConsole.log.restore()

  describe 'hasCamera', ->
    it.skip 'no assertions here. just checking my logic', ->
      for camera in cameras
        for rover in rovers
          console.log rover.label, camera.code, hasCamera(rover, camera)
