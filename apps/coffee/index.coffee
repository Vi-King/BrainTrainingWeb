$ ->
  Abbreviation = require './abbreviation'
  FourOperations = require './four_operations'

  start_game = ->
    locationPathName = location.pathname
    if locationPathName.indexOf("abbreviation") != -1
      new Abbreviation("#game-box")
      return

    if locationPathName.indexOf("four_operations") != -1
      new FourOperations("#game-box")
      return

    if locationPathName.indexOf("abbreviation") != -1
      return

  $('#start-game-btn').on 'click', ->
    FB.getLoginStatus (response) ->
      if response.status != 'connected'
        FB.login (response) ->
          if response.status == 'connected'
            start_game()
      else
        start_game()
