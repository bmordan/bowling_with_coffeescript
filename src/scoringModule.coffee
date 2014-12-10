_ = require 'underscore'
Frame = require './frame'

class Frames

  constructor: ->
    @frames = [new Frame]

  manageFrames: (index)->
    return if @frames.length == 10
    if _.last(@frames).throws[0] == 10 then @frames.push(new Frame)
    if _.last(@frames).throws.length == 2 then @frames.push(new Frame)
    _.each @frames, (frame) -> frame.index = index+=1

  manageBonuses: (index) ->
    if index == 0 then return
    if @frames[index-1].isSpare()  then @_manageSpares(index)
    if @frames[index-1].isStrike() then @_manageStrikes(index)
    @manageBonuses(index-=1)

  _manageSpares: (index) ->
    @frames[index-1].throws[2] = @frames[index].throws[0]

  _manageStrikes: (index) ->
    @frames[index-1].throws[1] = @frames[index].throws[0]
    if @frames[index].isStrike()
      @_manageSpecials(index)
    else
      @frames[index-1].throws[2] = @frames[index].throws[1]

  _manageSpecials: (index) ->
    return if @frames[index+1] == undefined
    index == 9 ? return : @frames[index-1].throws[2] = @frames[index+1].throws[0]

module.exports = Frames
