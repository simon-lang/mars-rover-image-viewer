module.exports = [
  '$http'
  ($http) ->
    getPhotos: (filter) ->
      return $http(
        method: 'POST'
        url: '/photos'
        data: filter
      )
    getManifest: (rover) ->
      return $http(
        method: 'POST'
        url: '/manifest'
        data: {rover}
      ).then ({data}) ->
        return data.photo_manifest
]
