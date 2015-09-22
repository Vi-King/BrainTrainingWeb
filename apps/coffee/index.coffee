$ ->
  Abbreviation = require './abbreviation'
  FourOperations = require './four_operations'

  locationPathName = location.pathname

  if locationPathName.indexOf("abbreviation") != -1
    new Abbreviation("#game-box")
    return

  if locationPathName.indexOf("four_operations") != -1
    new FourOperations("#game-box")
    return

  if locationPathName.indexOf("abbreviation") != -1
    new Abbreviation("#game-box")
    return

  $('#jsi-btn-start').on 'click', ->
    FB.getLoginStatus (response) ->
      console.log response
      if response.status != 'connected'
        FB.login (response) ->
          if response.status == 'connected'
            new Abbreviation('#game-box')
      else
        new Abbreviation('#game-box')

