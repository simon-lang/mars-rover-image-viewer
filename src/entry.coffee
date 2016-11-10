require './less/main.less'

angular = require 'angular'

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
      rover: 'Curiosity'
      cameras: 'FHAZ'

    $rootScope.enums =
      rovers: require './rovers.coffee'
      cameras: require './cameras.coffee'

    $rootScope.search = ->
      $rootScope.loading = true
      Photos.getPhotos(filter).then ({data}) ->
        console.log data.photos
        $rootScope.photos = data.photos
        $rootScope.loading = false
]
