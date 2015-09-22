class FourOperationsQuestions

  operations = [
    {
     op: '＋'
     calc: (l, r) ->
       l + r

    }
    {
     op: '−'
     calc: (l, r) ->
       l - r

   }
   {
     op: '×'
     calc: (l, r) ->
       l * r

   }
   {
     op: '÷'
     calc: (l, r) ->
       if (l != 0 and l < r) or r == 0 or l % r != 0
         return NaN
       l / r

    }
  ]

  create_answers = (l, r, answer_value, answer_ope_index) ->
    answers = []
    i = 0
    while i < operations.length
      if i == answer_ope_index
        answers.push true
      else
        answers.push operations[i].calc(l, r) == answer_value
      i++
    answers

  create_normal_operand = ->
    operand =
      l: Math.floor(Math.random() * 10)
      r: Math.floor(Math.random() * 10)
    operand

  create_div_operand = ->
    divisible_combination = [
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
      [1]
      [1, 2]
      [1, 3]
      [1, 2, 4]
      [1, 5]
      [1, 2, 3, 6]
      [1, 7]
      [1, 2, 4, 8]
      [1, 3, 9]
    ]
    l = Math.floor(Math.random() * 10)
    candidates = divisible_combination[l]
    operand =
      l: l
      r: candidates[Math.floor(Math.random() * candidates.length)]
    operand

  create_minus_operand = ->
    l = Math.floor(Math.random() * 10)
    operand =
      l: l
      r: Math.floor(Math.random() * l)
    operand

  create_question = ->
    operation_index = Math.floor(Math.random() * 4)
    operation = operations[operation_index]
    operand = undefined

    switch operation_index
      when 1
        operand = create_minus_operand()
      when 3
        operand = create_div_operand()
      else
        operand = create_normal_operand()

    calc_result = operation.calc(operand.l, operand.r)
    q =
      left: operand.l
      right: operand.r
      calc_result: calc_result
      answers: create_answers(operand.l, operand.r, calc_result, operation_index)
      answer_operation: operation.op
    q

  @data = ->
    q = []
    i = 0
    while i < 30
      q.push create_question()
      i++
    q

module.exports = FourOperationsQuestions
