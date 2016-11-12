module.exports = [
  '$http'
  ($http) ->
    return {
      getPhotos: (filter) ->
        return $http(
          method: 'POST'
          url: '/proxy'
          data: filter
        )
      getManifest: (rover) ->
        return $http(
          method: 'POST'
          url: '/manifest'
          data: {rover}
        ).then ({data}) ->
          return data.photo_manifest
    }
]
