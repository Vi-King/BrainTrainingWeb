Game = require './game'
View = require './abbreviation.view'
Questions = require './abbreviation_questions'

class Abbreviation extends Game

  @GAME_TIME = 1

  constructor: (box_id) ->
    # format questions
    @questions = Questions.data()
    @results = []
    # initialize view
    @view = new View(box_id, Abbreviation.GAME_TIME)
    @view.set_view_template '#question-tmpl'
    @view.on 'start': @, 'end': @, 'answered': @
    # count down start
    @view.init()

  start: =>
    @end_time = new Date().getTime() + (Abbreviation.GAME_TIME * 1000)
    @answered()

  pick_question: ->
    @questions.shift()

  answered: (result) ->
    @results.push result unless result == undefined
    q = @pick_question()
    if q != undefined
      @view.show_question q
    else
      @view.end()

  end: =>
    time = (@end_time - new Date().getTime()) / 1000;
    time = 0 if time < 0
    r = @results.filter (x) -> x
    score = (120 * r.length) - (60 * (@results.length - r.length)) + (Math.floor(time) * 10);
    @show_result score

module.exports = Abbreviation
