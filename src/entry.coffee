require './less/main.less'

angular = require 'angular'

app = angular.module 'lens-ui-code-test', []

app.service 'Photos', [
  '$http'
  ($http) ->
    return {
      getPhotos: () ->
        return $http.get '/proxy?earth_date=2015-6-3&api_key=DEMO_KEY'
    }
]

app.run [
  '$rootScope'
  'Photos'
  ($rootScope, Photos) ->

    $rootScope.filter =
      rovers: []
      cameras: []

    $rootScope.search = ->
      $rootScope.loading = true
      Photos.getPhotos().then ({data}) ->
        console.log data.photos
        $rootScope.photos = data.photos
        $rootScope.loading = false
]
