View = require './view'

class ResultView extends View
  constructor: (box_id) ->
    @el = $ box_id

  init: (score) ->
    deviation = 50.0 + ((score - 2000.0 ) / 60.0) # 偏差値
    people = Math.floor(Math.pow(100, ((deviation - 50) / 10))) # 何人に一人
    percent = (deviation - 50) * 4 # 東大合格率
    if deviation < 50
      income = 350 + (deviation - 50) * 7
    else
      income = 350 + (deviation - 50) * 40
    # 年収を四捨五入
    income = Math.floor(income / 10)
    income = income * 10

    # 3以下の場合3にする
    people = 3 if people < 3
    # マイナスの場合0にする
    percent = 0 if percent < 0

    @el.empty().append @tmpl({
      score:     score
      people:    people
      percent:   percent
      income:    income
    })
    new CountUp('deviation', 0.0, Math.round(deviation * 10) / 10, 1).start()

module.exports = ResultView
