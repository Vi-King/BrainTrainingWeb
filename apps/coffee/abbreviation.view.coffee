GameView = require './game.view'

class AbbreviationView extends GameView
  constructor: (box_id, sec) ->
    super box_id, sec

  init: ->
    that = @
    $(document).on 'click', '.ans', ->
      that.answered $(@).data('res')
    super()
    @setup()

  setup: ->
    @init_tmpl = Handlebars.compile """
<div class="ui fluid card">
  <div class="content">
    <div class="header" style="text-align: center;">正しい略記はどれ？</div>
  </div>
  <div class="content" id="question">
  </div>
</div>
"""
    @screen.empty().append @init_tmpl()

  show_question: (question) ->
    $('#question').empty().append(@tmpl(question))

module.exports = AbbreviationView
