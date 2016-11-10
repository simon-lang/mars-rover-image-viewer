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
    }
]
