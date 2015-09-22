class FourOperationsQuestions


  @operations = [
    {
      op: "+"
      calc: (l, r) ->
        l + r

    }
    {
      op: "-"
      calc: (l, r) ->
        l - r

    }
    {
      op: "*",
      calc: (l, r) ->
        l * r

    }
    {
      op: "/",
      calc: (l, r) ->
        l / r

    }
  ]

  @createNormalOperand = ->
    operand =
      l: Math.floor(Math.random() * 10)
      r: Math.floor(Math.random() * 10)
    operand

  @createDivOperand = ->
    divisibleCombination = [
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
    candidates = divisibleCombination[l]
    operand =
      l: l
      r: candidates[Math.floor(Math.random() * candidates.length)]
    operand

  @createMinusOperand = ->
    l = Math.floor(Math.random() * 10)
    operand =
      l: l
      r: Math.floor(Math.random() * l)
    operand

  @calcAnswers = (l, r, a) ->


  @createQuestion = ->
    operationIndex = Math.floor(Math.random() * 4)
    operation = FourOperations.operasions[operationIndex]
    operand = undefined

    switch operationIndex
      when 1
        operand = FourOperationsQuestions.createMinusOperand()
      when 3
        operand = FourOperationsQuestions.createDivOperand()
      else
        operand = FourOperationsQuestions.createNormalOperand()

    q =
      left: operand.l
      right: operand.r
      calcResult: operation.calc(operand.l, operand.r)
      answerIndex: operationIndex
      answerOperation: operation.op
    q

  @data = ->
    q = []
    i = 0
    while i < 30
      q.push FourOperationsQuestions.createQuestion()
      i++
    {
      questions: q
    }

module.exports = FourOperationsQuestions
