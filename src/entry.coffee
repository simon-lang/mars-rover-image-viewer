require './less/main.less'

window._ = require 'lodash'

angular = require 'angular'

app = angular.module 'lens-ui-code-test', []

app.service 'localStorageService', require './services/localStorageService.coffee'
app.service 'photoService', require './services/photoService.coffee'

app.directive 'tabs', ->
  template: require './templates/tabs.pug'

app.directive 'filters', ->
  template: require './templates/filters.pug'

app.directive 'results', ->
  template: require './templates/results.pug'

app.directive 'collected', ->
  template: require './templates/collected.pug'

app.run require './main.coffee'
