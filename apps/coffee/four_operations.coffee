Game = require './game'
View = require './abbreviation.view'
Questions = require './abbreviation_questions'

class Abbreviation extends Game

  constructor: (box_id) ->
    # format questions
    @questions = Questions.data()
    @results = []
    # initialize view
    @view = new View(box_id, 60)
    @view.set_view_template '#abbreviation-question-tmpl'
    @view.on 'start': @, 'end': @, 'answered': @
    # count down start
    @view.init()

  start: =>
    console.log 'start game'
    @view.show_question @pick_question()

  pick_question: ->
    n = Math.floor(Math.random() * @questions.length)
    @questions[n]

  answered: (result) ->
    @results.push result
    @view.show_question @pick_question()

module.exports = Abbreviation
