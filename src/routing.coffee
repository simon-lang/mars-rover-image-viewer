module.exports = [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.when /^\/?$/, '/results'
    $urlRouterProvider.when '', '/results'

    $urlRouterProvider.otherwise '/404'

    $stateProvider.state
      name: 'results',
      url: '/results',
      template: require './templates/results.pug'

    $stateProvider.state
      name: 'collected',
      url: '/collected',
      template: require './templates/collected.pug'

    $stateProvider.state
      name: 'import',
      url: '/share/{encoded}',
      template: require './templates/shared.pug'
      controller: [
        '$scope'
        '$stateParams'
        'photoService'
         ($scope, $stateParams, photoService) ->
            $scope.shared = photoService.decode $stateParams.encoded
       ]

    $stateProvider.state
      name: 'manifest',
      url: '/manifest',
      template: require './templates/manifest.pug'
]
