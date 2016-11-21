require 'angular-ui-router'

require './styles/bootstrap.min.css'
require './styles/main.styl'

app = angular.module 'mars-rover-image-viewer', [
  'ui.bootstrap'
  'ui.router'
  'chart.js'
]

app.config require './routing.coffee'

app.service 'localStorageService', require './services/localStorageService.coffee'
app.service 'photoService', require './services/photoService.coffee'

directives = [
  'header'
  'tabs'
  'filters'
  'photo'
]

_.each directives, (directive) ->
  app.directive directive, ->
    template: require './templates/' + directive + '.pug'

app.directive 'loadImage', require './directives/loadImageDirective.coffee'
app.directive 'selectOnClick', require './directives/selectOnClickDirective.coffee'

app.controller 'MainController', require './main.coffee'

app.run [
  '$rootScope'
  '$window'
  ($rootScope, $window) ->
    resize = _.debounce ->
      $rootScope.isMobile = $window.matchMedia("(max-width: 767px)").matches
      $rootScope.$applyAsync()
    , 100
    angular.element($window).resize resize
    resize()
]
