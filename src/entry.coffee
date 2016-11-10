require './less/main.less'

_ = require 'lodash'
angular = require 'angular'

rovers = require './rovers.coffee'
cameras = require './cameras.coffee'

app = angular.module 'lens-ui-code-test', []

app.service 'Photos', [
  '$http'
  ($http) ->
    return {
      getPhotos: (filter) ->
        return $http(
          method: 'POST'
          url: '/proxy'
          data: filter
        )
    }
]

app.run [
  '$rootScope'
  'Photos'
  ($rootScope, Photos) ->

    $rootScope.filter = filter =
      date: '2015-6-3'
      rover: rovers[0]
      camera: cameras[0]

    $rootScope.enums =
      rovers: rovers
      cameras: cameras

    $rootScope.saved = []

    $rootScope.save = (photo) ->
      photo.saved = !photo.saved
      existing = _.find $rootScope.saved, id: photo.id
      if existing?
        $rootScope.saved = _.reject $rootScope.saved, id: photo.id
      else
        $rootScope.saved.push photo

    $rootScope.search = ->
      $rootScope.pane = 'results'
      $rootScope.photos = []
      $rootScope.loading = true
      Photos.getPhotos(filter).then ({data}) ->
        console.log data.photos
        $rootScope.photos = data.photos
        $rootScope.loading = false
]
