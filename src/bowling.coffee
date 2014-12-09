_ = require 'underscore'
Frame = require './frame'

class Bowling

  constructor: ->
    @frames = [new Frame]

  add: (pinsDowned) ->
    @_manageFrames()
    _.last(@frames).throws.push pinsDowned
    @_manageBonuses(_.last(@frames))

  score: ->
    @frames.reduce ( (score, frame) -> score + frame.total() ), 0

  _manageFrames: ->
    index = -1
    if _.last(@frames).throws[0] == 10 then @frames.push(new Frame)
    if _.last(@frames).throws.length == 2 then @frames.push(new Frame)
    _.each @frames, (frame) -> frame.index = index+=1

  _manageBonuses: (frame) ->
    if @frames.length == 1 then return
    if @frames[frame.index-1].isSpare() then @frames[frame.index-1].throws.push _.first(frame.throws)

module.exports = Bowling
