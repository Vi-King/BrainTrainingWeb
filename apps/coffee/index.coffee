$ ->
  Abbreviation = require './abbreviation'

  $('#jsi-btn-start').on 'click', ->
    FB.getLoginStatus (response) ->
      console.log response
      if response.status != 'connected'
        FB.login (response) ->
          if response.status == 'connected'
            game = new Abbreviation('#game-box')
      else
        game = new Abbreviation('#game-box')

