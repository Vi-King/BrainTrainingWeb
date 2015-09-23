GameView = require './game.view'

class FourOperationsView extends GameView
  constructor: (box_id, sec) ->
    super box_id, sec

  init: (questions) ->
    @screen.empty().append(@tmpl({questions: questions}))
    $("#ope-q-box-0").css("border-color", "red")

    that = @
    $(document).on 'click', '.four-ope-answer-btn', ->
      children = $("#four-ope-q-table").children()
      # 全部解いた。
      if children.length <= 2
        that.end()
        return

      # index 0 は一個前の問題。
      $now_question = $(children[1])
      now_question_index = $now_question.data("index")
      next_question_index = now_question_index + 1
      $answered = $(@)
      
      # 結果を溜め込む
      result = questions[now_question_index].answers[$answered.data("index")] 
      console.log(questions[now_question_index].answers)
      that.answered result
      
      # 問題に o/x つける
      $operation_q_box = $("#ope-q-box-" + now_question_index)
      if result
        $operation_q_box.css("border-radius", "50%")
        $operation_q_box.css("border-color", "red")
        $operation_q_box.text($answered.text())
      else
        $operation_q_box.text("×")
        $operation_q_box.css("color", "red")
        $operation_q_box.css("border-color", "black")
      
      # 一個スライド（古いの削除）
      $(children[0]).slideUp 80, ->
        $(@).remove()
        $('#ope-q-box-' + next_question_index).css 'border-color', 'red'
    super()

module.exports = FourOperationsView
