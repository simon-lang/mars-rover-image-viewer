rovers = require './enums/rovers.coffee'
cameras = require './enums/cameras.coffee'

module.exports = [
  '$scope'
  'localStorageService'
  'photoService'
  ($scope, localStorageService, photoService) ->

    $scope.pane = 'results'

    $scope.filter = filter = localStorageService.get('filter') or
      date: '2015-6-3'
      rover: rovers[0].label
      camera: cameras[0].code

    $scope.enums =
      rovers: rovers
      cameras: cameras

    $scope.saved = localStorageService.get('saved') or []

    isSaved = (photo) ->
      existing = _.find $scope.saved, id: photo.id
      return existing?

    $scope.save = (photo) ->
      photo.saved = !photo.saved
      if isSaved photo
        $scope.saved = _.reject $scope.saved, id: photo.id
      else
        $scope.saved.push photo

      localStorageService.set 'saved', $scope.saved

    $scope.search = ->
      localStorageService.set('filter', filter)
      $scope.error = null
      $scope.pane = 'results'
      $scope.photos = []
      $scope.loading = true
      photoService.getPhotos(filter)
      .then ({data}) ->
        unless data.photos
          throw new Error 'No Results'
        $scope.photos = data.photos
        $scope.photos?.map (photo) ->
          photo.saved = isSaved photo
          return photo
      .catch (error) ->
        $scope.error = error.message
      .finally ->
        $scope.loading = false
]
