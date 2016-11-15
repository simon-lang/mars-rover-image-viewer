require './less/bootstrap.min.css'
require './less/main.less'

app = angular.module 'mars-rover-image-viewer', [
  'ui.bootstrap'
]

app.service 'localStorageService', require './services/localStorageService.coffee'
app.service 'photoService', require './services/photoService.coffee'

directives = [
  'header'
  'tabs'
  'filters'
  'results'
  'collected'
]

_.each directives, (directive) ->
  app.directive directive, ->
    template: require './templates/' + directive + '.pug'

app.controller 'MainController', require './main.coffee'
