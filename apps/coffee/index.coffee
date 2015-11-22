$ ->
  Abbreviation = require './abbreviation'
  FourOperations = require './four_operations'
  View = require './view'

  init_common_views = ->
    header_view = new View()
    header_view.set_view_template '/common/header'
    $('#header').append header_view.tmpl()

    footer_view = new View()
    footer_view.set_view_template '/common/footer'
    $('#footer').append footer_view.tmpl()

    footer_app_view = new View()
    footer_app_view.set_view_template '/common/footer-to-app'
    $('#footer-to-app').append footer_app_view.tmpl()

  get_fb_app_id = ->
    if location.hostname == 'braintraining.treasurestudio.jp'
      return '1498183703834483'
    if location.hostname == 'dev-braintraining.treasurestudio.jp'
      return '1499881553664698'
    return '1498243540495166'

  init_fb_sdk = ->
    window.fbAsyncInit = ->
      FB.init
        appId: get_fb_app_id()
        xfbml: true
        version: 'v2.4'
      return

    ((d, s, id) ->
      js = undefined
      fjs = d.getElementsByTagName(s)[0]
      if d.getElementById(id)
        return
      js = d.createElement(s)
      js.id = id
      js.src = '//connect.facebook.net/en_US/sdk.js'
      fjs.parentNode.insertBefore js, fjs
      return
    ) document, 'script', 'facebook-jssdk'

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

  init_fb_sdk()

  $('#start-game-btn').on 'click', ->
    FB.getLoginStatus (response) ->
      if response.status != 'connected'
        FB.login (response) ->
          if response.status == 'connected'
            start_game()
      else
        start_game()

  init_common_views()

  IPHONE_LINK = "https://itunes.apple.com/app/apple-store/id570172036?pt=550980&ct=shindan&mt=8"
  ANDROID_LINK = "https://play.google.com/store/apps/details?id=net.viking.cocos2dx.BTAllGame&utm_source=shindan&utm_medium=web_app&utm_campaign=shindan_web_app"
  isAndroid = navigator.userAgent.indexOf('Android') != -1
  ua = navigator.userAgent
  console.log isAndroid

  $('.jsc-app').on 'click', ->
    if isAndroid
      location.href = ANDROID_LINK
    else
      location.href = IPHONE_LINK

