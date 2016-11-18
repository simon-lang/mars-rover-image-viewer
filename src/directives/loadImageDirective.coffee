module.exports = ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    newImage = jQuery new Image()
    src = attrs.loadImage
    newImage.on 'load', ->
      element.attr 'src', src
    newImage.attr 'src', src
