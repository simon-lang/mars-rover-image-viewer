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
      template: '<results></results>'

    $stateProvider.state
      name: 'collected',
      url: '/collected',
      template: '<collected></collected>'

    $stateProvider.state
      name: 'manifest',
      url: '/manifest',
      template: require './templates/manifest.pug'
]
