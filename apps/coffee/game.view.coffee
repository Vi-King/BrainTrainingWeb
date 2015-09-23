View = require './view'

class GameView extends View
  constructor: (box_id, @sec) ->
    throw new Error("please pass selector for game view.") unless box_id
    @el = $ box_id
    throw new Error("game box(#{box_id}) does not exists.") if @el.length == 0

    $('body').append $('<div class="count-down" id="count-down" />')
    $('body').append $('<div id="result"></div>')
    @el.prepend $("<div class='row game-timer'><span class='right floated'>タイム　<span id='timer'>#{@sec}.0</span></span></div>")
    @el.prepend $("<div id='time-over' style='display: none;'>time over</div>")
    @screen = $('<div id="game-screen"></div>')
    @el.append @screen

  init: ->
    @count_down(3)

  count_down: (cnt) ->
    @count = cnt
    $('#count-down').html(@count).show()
    .fadeOut 1000, =>
      if @count > 1
        @count_down --@count
      else if @count == 1
        @count--
        @start()

  start: ->
    @start_timer()

  start_timer: =>
    @end_time = new Date().getTime() + (@sec * 1000)
    @timer_id = setInterval @timer, 100

  stop_timer: =>
    clearInterval @timer_id

  timer: =>
    t = @end_time - new Date().getTime()
    if t <= 0
      @stop_timer()
      $('#timer').text '0.0'
      @show_time_over()
    else
      $('#timer').text (Math.round(t / 100) / 10).toFixed(1)

  show_time_over: ->
    $('#time-over').show()
    setTimeout @end, 1000

  end: =>
    @stop_timer()

  show_question: (question) ->

  answered: (result) ->
    $('#result').text({'true': '◯', 'false': '☓'}[result]).show().fadeOut 500

module.exports = GameView
