_ = require 'underscore'
Frame = require './frame'

class Bowling

  constructor: ->
    @frames = [new Frame]

  add: (pinsDowned) ->
    @_arrangeFrames()
    _.last(@frames).throws.push pinsDowned

  score: ->
    @frames.reduce ((score, frame) -> score + frame.total()), 0

  _arrangeFrames: ->
    if _.last(@frames).throws[0] == 10 then @frames.push(new Frame)
    if _.last(@frames).throws.length ==   2 then @frames.push(new Frame)

module.exports = Bowling
