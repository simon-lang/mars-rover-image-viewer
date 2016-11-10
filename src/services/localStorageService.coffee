module.exports = [
  '$window'
  ($window) ->
    get: (key) ->
      try
        JSON.parse $window.localStorage.getItem key
      catch e
        console.warn e
        return null
    set: (key, value) ->
      try
        value = JSON.stringify value
        $window.localStorage.setItem key, value
      catch e
        console.warn e
        return null
]
