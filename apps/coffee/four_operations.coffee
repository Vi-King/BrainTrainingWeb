Game = require './game'
View = require './four_operations.view'
Questions = require './four_operations_questions'

class FourOperations extends Game

  constructor: (box_id) ->
    # format questions
    @questions = Questions.data()
    @results = []
    # initialize view
    @view = new View(box_id, 60)
    @view.set_view_template '#four-operations-question-tmpl'
    @view.on 'start': @, 'end': @, 'answered': @
    # count down start
    @view.init(@questions)

  start: =>
    console.log 'start game'

  answered: (result) ->
    @results.push result

module.exports = FourOperations
