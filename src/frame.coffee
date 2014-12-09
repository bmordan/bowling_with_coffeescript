class Frame

  constructor: ->
    @throws = []

  total: ->
    @throws.reduce (total, throws) -> total + throws

  isSpare: ->
    @total() == 10 and @throws.length == 2 ? true : false

  isStrike: ->
    @total() == 10 and @throws.length == 1 ? true : false

module.exports = Frame
