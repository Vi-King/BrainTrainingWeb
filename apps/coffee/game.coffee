Events = require './events'
ResultView = require './result.view'

class Game extends Events

  show_result: (result) ->
    @result_view = new ResultView('#game-box')
    @result_view.set_view_template '/common/result-view-tmpl'
    @result_view.init result

module.exports = Game
