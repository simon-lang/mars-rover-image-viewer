rovers = require './enums/rovers.coffee'
cameras = require './enums/cameras.coffee'

module.exports = [
  '$rootScope'
  'localStorageService'
  'photoService'
  ($rootScope, localStorageService, photoService) ->

    $rootScope.pane = 'results'

    $rootScope.filter = filter =
      date: '2015-6-3'
      rover: rovers[0]
      camera: cameras[0]

    $rootScope.enums =
      rovers: rovers
      cameras: cameras

    $rootScope.saved = localStorageService.get('saved') or []

    isSaved = (photo) ->
      existing = _.find $rootScope.saved, id: photo.id
      return existing?

    $rootScope.save = (photo) ->
      photo.saved = !photo.saved
      if isSaved photo
        $rootScope.saved = _.reject $rootScope.saved, id: photo.id
      else
        $rootScope.saved.push photo

      localStorageService.set 'saved', $rootScope.saved

    $rootScope.search = ->
      $rootScope.pane = 'results'
      $rootScope.photos = []
      $rootScope.loading = true
      photoService.getPhotos(filter).then ({data}) ->
        $rootScope.photos = data.photos
        $rootScope.photos.map (photo) ->
          photo.saved = isSaved photo
          return photo
        $rootScope.loading = false
]
