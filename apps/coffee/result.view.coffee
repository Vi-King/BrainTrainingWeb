View = require './view'

class ResultView extends View
  constructor: (box_id) ->
    @el = $ box_id

  init: (result) ->
    @el.empty().append @tmpl(result)

module.exports = ResultView
