GameView = require './game.view'

class AbbreviationView extends GameView
  constructor: (box_id, sec) ->
    super box_id, sec

  init: ->
    that = @
    $(document).on 'click', '.ans', ->
      that.answered $(@).data('res')
    super()

  show_question: (question) ->
    $('#question').empty().append(@tmpl(question))

module.exports = AbbreviationView
