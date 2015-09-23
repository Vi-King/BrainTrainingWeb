Game = require './game'
View = require './four_operations.view'
Questions = require './four_operations_questions'

class FourOperations extends Game

  @GAME_TIME = 60

  constructor: (box_id) ->
    # format questions
    @questions = Questions.data()
    @results = []
    # initialize view
    @view = new View(box_id, FourOperations.GAME_TIME)
    @view.set_view_template '#four-operations-question-tmpl'
    @view.on 'start': @, 'end': @, 'answered': @
    # count down start
    @view.init(@questions)

  start: =>
    @end_time = new Date().getTime() + (FourOperations.GAME_TIME * 1000)

  answered: (result) ->
    @results.push result

  end: =>
    time = (@end_time - new Date().getTime()) / 1000;
    time = 0 if time < 0
    r = @results.filter (x) -> x
    score = (60 * r.length) - (120 * (@results.length - r.length)) + (Math.floor(time) * 50);
    @show_result score

module.exports = FourOperations
