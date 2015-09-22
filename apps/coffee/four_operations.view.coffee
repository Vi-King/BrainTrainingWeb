GameView = require './game.view'

class FourOperationsView extends GameView
  constructor: (box_id, sec) ->
    super box_id, sec

  init: (questions) ->
    $('#four-ope-questions').append(@tmpl(questions))

    that = @
    $(document).on 'click', '.four-ope-answer-btn', ->
      $now_question = $("#four-ope-q-table div:first")
      now_question_index = $now_question.data("index") || 0
      console.log(now_question_index)
      that.answered true
    super()

module.exports = FourOperationsView
