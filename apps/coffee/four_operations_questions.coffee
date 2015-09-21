class FourOperationsQuestions

  @createNormalOperand = ->
    operand =
      l: Math.floor(Math.random() * 10)
      r: Math.floor(Math.random() * 10)
    operand

  @createDivisibleOperand = ->
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

  @createQuestion = ->
    operations = [
      {
        op: "+",
        calc: (l, r) ->
          l + r

      }
      {
        op: "-",
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
    operationIndex = Math.floor(Math.random() * 4)
    operation = operations[operationIndex]
    operand = undefined

    if operationIndex != 3
      operand = FourOperationsQuestions.createNormalOperand
    else
      operand = FourOperationsQuestions.createDivisibleOperand
     
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
      q.push FourOperationsQuestions.createQuestion
      i++
    q

module.exports = FourOperationsQuestions
