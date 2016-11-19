rovers = require './enums/rovers.coffee'
cameras = require './enums/cameras.coffee'

favourites = require './favourites.coffee'

module.exports = [
  '$scope'
  '$state'
  '$window'
  'localStorageService'
  'photoService'
  ($scope, $state, $window, localStorageService, photoService) ->

    $scope.$state = $state
    $scope.searchBy = 'Earth Date'
    $scope.manifests = manifests = {}

    $scope.filter = filter = localStorageService.get('filter') or
      date: null
      sol: null
      rover: rovers[0].label
      camera: cameras[0].code

    if $scope.filter.date
      $scope.filter.date = moment($scope.filter.date).toDate()

    $scope.enums =
      rovers: rovers
      cameras: cameras

    $scope.photos = []
    $scope.saved = saved = localStorageService.get('saved') or []

    $scope.dateOptions = {}

    isSaved = (photo) ->
      existing = _.find $scope.saved, id: photo.id
      return existing?

    $scope.import = ->
      $scope.saved = favourites

    $scope.findSimilar = (photo) ->
      $scope.searchBy = 'Earth Date'
      filter.rover = photo.rover.name
      filter.camera = photo.camera.name
      filter.date = moment(photo.earth_date).toDate()
      $scope.search()

    $scope.save = (photo) ->
      photo.saved = !photo.saved
      if isSaved photo
        $scope.saved = _.reject $scope.saved, id: photo.id
      else
        $scope.saved.push photo

      localStorageService.set 'saved', $scope.saved

    _updateManifest = (manifest) ->
      $scope.manifests[filter.rover] = manifest
      minDate = moment(manifest.landing_date).toDate()
      maxDate = moment(manifest.max_date).toDate()
      $scope.dateOptions = { minDate, maxDate }

      if filter.sol is null and $scope.searchBy is 'Martian Sol'
        filter.sol = 1

      if $scope.filter.date is null or $scope.filter.date < minDate or $scope.filter.date > maxDate
        $scope.filter.date = moment(manifest.landing_date).toDate()

      drawChart()

    $scope.updateManifest = ->
      if $scope.manifests[filter.rover]
        _updateManifest $scope.manifests[filter.rover]
      else
        photoService.getManifest filter.rover
        .then _updateManifest
        .catch (err) ->
          console.warn 'ERR', err

    $scope.search = ->
      if $scope.loading
        return
      data = _.clone filter
      if $scope.searchBy is 'Martian Sol'
        data.sol = filter.sol
        delete data.earth_date
      else
        data.earth_date = filter.date
        delete data.sol

      localStorageService.set('filter', data)
      $scope.error = null
      $state.go 'results'
      $scope.photos = []
      $scope.loading = true
      photoService.getPhotos(data)
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

    # This method is used by the camera filter dropdown in accordance with
    #  the ng-options directive's `disable when <expression>` functionality
    # The camera.rovers and rover.flag values are used to form a bitmask.
    # Next rover to be added will require a flag value of 8, then 16, etc.
    # Any camera that exists on the new rover, will need to increment its
    #  rovers field by 8.
    $scope.hasCamera = (rover, camera) ->
      if $scope.searchBy is 'Martian Sol' and $scope.manifests[filter.rover]?.photos[filter.sol]?
        return camera.code in $scope.manifests[filter.rover].photos[filter.sol].cameras
      rover = _.find rovers, label: rover
      return (camera.rovers | rover.flag) is camera.rovers # bitmask

    $scope.currentManifest = ->
      return manifests[filter.rover]

    $scope.shareLink = ->
      base = $window.location.origin + $window.location.pathname + '#/share/'
      code = photoService.encode $scope.saved
      return base + code

    $scope.selectSol = (points, evt) ->
      # console.log points[0]
      sol = parseInt points[0].label.split('Sol ')[1] # todo: got to be a nicer way
      entry = _.find $scope.currentManifest().photos, {sol}
      unless filter.camera in entry.cameras
        console.log 'HAD TO UPDATE CAMERA BECAUSE', filter.camera, 'not in ', entry.cameras
        filter.camera = entry.cameras[0]
      filter.sol = sol
      $scope.searchBy = 'Martian Sol'
      $scope.search()

    $scope.limit = 20
    $scope.offset = 0

    $scope.decreaseOffset = ->
      $scope.offset -= $scope.limit
      drawChart()

    $scope.increaseOffset = ->
      $scope.offset += $scope.limit
      drawChart()

    drawChart = ->
      labels = _.map manifests[filter.rover].photos, (photo) -> 'Sol ' + photo.sol
      $scope.labels = labels.slice $scope.offset, $scope.offset + $scope.limit
      $scope.series = ['Photos']
      data = _.map manifests[filter.rover].photos, (photo) -> photo.total_photos
      $scope.data = [
        data.slice $scope.offset, $scope.offset + $scope.limit
      ]

      $scope.datasetOverride = [{ yAxisID: 'y-axis-1' }, { yAxisID: 'y-axis-2' }];
      $scope.options = {}

    $scope.updateManifest()

]
