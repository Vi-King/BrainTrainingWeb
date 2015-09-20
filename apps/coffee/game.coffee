Events = require './events'
ResultView = require './result.view'

class Game extends Events

  end: ->
    @result_view = new ResultView('#game-box')
    @result_view.set_view_template '#result-view-tmpl'
    @result_view.init({
      'income': '200',
      'people': '3',
      'score': 0,
      'deviation': 16.7
      'percent': 0
    })

module.exports = Game
