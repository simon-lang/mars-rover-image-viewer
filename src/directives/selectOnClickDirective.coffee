module.exports = ->
  link: (scope, element, attrs) ->
    element.on 'click', ->
      element.select()
