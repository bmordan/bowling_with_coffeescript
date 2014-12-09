chai = require 'chai'
expect = chai.expect
Bowling = require '../src/bowling'

describe 'You play like this', ->

  bowling = null

  beforeEach ->
    bowling = new Bowling()

  it 'take a bowl, you score 3', ->
    bowling.add(3)
    expect(bowling.score()).to.equal 3

  it 'take another bowl, you score 6', ->
    bowling.add(3)
    bowling.add(3)
    expect(bowling.score()).to.equal 6

  it 'get all the pins down in two goes you get a spare', ->
    bowling.add(3)
    bowling.add(7)
    expect(bowling.score()).to.equal 10

  it 'automatically adds frames as the game goes along', ->
    bowling.add(1) for [1..5]
    expect(bowling.frames.length).to.equal 3

  it 'automagically adds a new frame after a strike', ->
    bowling.add(10)
    bowling.add(2)
    expect(bowling.frames.length).to.equal 2

  it 'manage bonuses takes care of awarding bonus points', ->
   bowling.add(3)
   bowling.add(7)
   bowling.add(5)
   expect(bowling.frames[0].throws[2]).to.equal 5

  it 'a spare gets a bonus which is the value of the next bowl', ->
    bowling.add(3)
    bowling.add(7)
    bowling.add(5)
    expect(bowling.score()).to.equal 20
