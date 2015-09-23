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

  get_fb_app_id = ->
    if location.hostname == 'braintraining.treasurestudio.jp'
      return '1498183703834483'
    if location.hostname == 'dev-braintraining.treasurestudio.jp'
      return '1499881553664698'
    return '1498243540495166'

  window.FB_APP_ID = get_fb_app_id()

  $('#start-game-btn').on 'click', ->
    FB.getLoginStatus (response) ->
      if response.status != 'connected'
        FB.login (response) ->
          if response.status == 'connected'
            start_game()
      else
        start_game()
