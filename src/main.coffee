rovers = require './enums/rovers.coffee'
cameras = require './enums/cameras.coffee'

module.exports = [
  '$rootScope'
  '$templateCache'
  'localStorageService'
  'photoService'
  ($rootScope, $templateCache, localStorageService, photoService) ->

    $rootScope.pane = 'results'

    $rootScope.filter = filter = localStorageService.get('filter') or
      date: '2015-6-3'
      rover: rovers[0].label
      camera: cameras[0].code

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
      localStorageService.set('filter', filter)
      $rootScope.error = null
      $rootScope.pane = 'results'
      $rootScope.photos = []
      $rootScope.loading = true
      photoService.getPhotos(filter)
      .then ({data}) ->
        unless data.photos
          throw new Error 'No Results'
        $rootScope.photos = data.photos
        $rootScope.photos?.map (photo) ->
          photo.saved = isSaved photo
          return photo
      .catch (error) ->
        $rootScope.error = error.message
      .finally ->
        $rootScope.loading = false
]
