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
    it 'matches the table from the nasa api docs', ->
      s = ''
      for camera in cameras
        for rover in rovers
          s += rover.label + ' ' + camera.code + ' ' + hasCamera(rover, camera) + ' '
      assert.equal s.replace(/\s/g, ''), """
        Curiosity   FHAZ    true
        Opportunity FHAZ    true
        Spirit      FHAZ    true
        Curiosity   RHAZ    true
        Opportunity RHAZ    true
        Spirit      RHAZ    true
        Curiosity   MAST    true
        Opportunity MAST    false
        Spirit      MAST    false
        Curiosity   CHEMCAM true
        Opportunity CHEMCAM false
        Spirit      CHEMCAM false
        Curiosity   MAHLI   true
        Opportunity MAHLI   false
        Spirit      MAHLI   false
        Curiosity   MARDI   true
        Opportunity MARDI   false
        Spirit      MARDI   false
        Curiosity   NAVCAM  true
        Opportunity NAVCAM  true
        Spirit      NAVCAM  true
        Curiosity   PANCAM  false
        Opportunity PANCAM  true
        Spirit      PANCAM  true
        Curiosity   MINITES false
        Opportunity MINITES true
        Spirit      MINITES true
      """.replace /\s/g, ''
