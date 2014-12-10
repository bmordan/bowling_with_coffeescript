_ = require 'underscore'
# Frames = require './scoringModule'

class Bowling

  constructor: ->
    @game = new Frames()

  add: (pinsDowned) ->
    @game.manageFrames(-1)
    _.last(@game.frames).throws.push pinsDowned

  score: ->
    @game.manageBonuses(@game.frames.length-1)
    @game.frames.reduce ( (score, frame) -> score + frame.total() ), 0

module.exports = Bowling
