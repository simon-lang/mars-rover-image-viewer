require './less/main.less'

angular = require 'angular'

app = angular.module 'lens-ui-code-test', []

app.run ->
  console.log 'OK'
