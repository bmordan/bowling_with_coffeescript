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

describe 'Bonus Scoreing', ->

  bowling = null

  beforeEach ->
    bowling = new Bowling()

  it 'the most simple bonus is the spare', ->
    bowling.add(3)
    bowling.add(7)
    bowling.add(5)
    expect(bowling.score()).to.equal 20

  it 'next is the single strike', ->
    bowling.add(10)
    bowling.add(1)
    bowling.add(1)
    expect(bowling.score()).to.equal 14

  it 'then its the double', ->
    bowling.add(10) for [1..2]
    expect(bowling.score()).to.equal 30

  it 'then the turkey', ->
    bowling.add(10) for [1..3]
    expect(bowling.score()).to.equal 60

describe 'Dealing with the final frame', ->

  bowling = null

  beforeEach ->
    bowling = new Bowling()
    bowling.add(10) for [1..9]

  it 'stops scoreing on the 9th frame', ->
    expect(bowling.score()).to.equal 240

  it 'totals the final frame as usual', ->
    bowling.add(1) for [1..2]
    expect(bowling.score()).to.equal 245

  it 'what happens to strikes in the final frame?', ->
    bowling.add(10)
    expect(bowling.score()).to.equal 270

  it 'what happens to strikes in the final frame?', ->
    bowling.add(10) for [1..2]
    expect(bowling.score()).to.equal 290

  it 'scores the perfect game', ->
    bowling.add(10) for [1..3]
    expect(bowling.score()).to.equal 300

describe 'Test games', ->

  bowling = null

  beforeEach ->
    bowling = new Bowling()

  it 'correctly scores a proper game', ->
    bowling.add(1)
    bowling.add(3)
    bowling.add(8)
    bowling.add(1)
    bowling.add(10)
    bowling.add(2)
    bowling.add(7)
    bowling.add(5)
    bowling.add(5)
    bowling.add(3)
    bowling.add(7)
    bowling.add(7)
    bowling.add(0)
    bowling.add(10)
    bowling.add(10)
    bowling.add(3)
    bowling.add(7)
    bowling.add(4)
    expect(bowling.score()).to.equal 135
