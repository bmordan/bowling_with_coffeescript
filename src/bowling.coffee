_ = require 'underscore'
Frame = require './frame'

class Bowling

  constructor: ->
    @frames = [new Frame]

  add: (pinsDowned) ->
    @_manageFrames(-1)
    _.last(@frames).throws.push pinsDowned

  score: ->
    @_manageBonuses(@frames.length-1)
    @frames.reduce ( (score, frame) -> score + frame.total() ), 0

  _manageFrames: (index)->
    if _.last(@frames).throws[0] == 10 then @frames.push(new Frame)
    if _.last(@frames).throws.length == 2 then @frames.push(new Frame)
    _.each @frames, (frame) -> frame.index = index+=1

  _manageBonuses: (index) ->
    if index == 0 then return
    if @frames[index-1].isSpare() then @_manageSpares(index-1)

  _manageSpares: (index) ->
    @frames[index].throws[2] = @frames[index+1].throws[0]

module.exports = Bowling
