require './less/main.less'

window._ = require 'lodash'

angular = require 'angular'

app = angular.module 'lens-ui-code-test', []

app.service 'localStorageService', require './services/localStorageService.coffee'
app.service 'photoService', require './services/photoService.coffee'

app.directive 'filters', ->
  template: require './templates/filters.pug'

app.run require './main.coffee'
