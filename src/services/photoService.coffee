API_URL = 'https://api.nasa.gov/mars-photos/api/v1/'
API_KEY = 'wwYXJBLASfX4wNrbLfEetDdx6U3EbRSm1Lx93DGa'

module.exports = [
  '$http'
  ($http) ->
    getPhotos: (filter) ->
      url = API_URL + 'rovers/' + filter.rover.toLowerCase() + '/photos' + '?camera=' + filter.camera
      if filter.sol?
        url += '&sol=' + filter.sol
      else
        url += '&earth_date=' + moment(filter.earth_date).format('YYYY-M-D')
      url += '&api_key=' + (API_KEY or 'DEMO_KEY')
      return $http(
        method: 'GET'
        url: url
      )
    getManifest: (rover) ->
      return $http(
        method: 'GET'
        url: API_URL + 'manifests/' + rover.toLowerCase() + '?api_key=' + (API_KEY or 'DEMO_KEY')
      ).then ({data}) ->
        return data.photo_manifest
]
