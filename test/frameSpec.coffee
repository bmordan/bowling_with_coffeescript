chai = require 'chai'
expect = chai.expect
Frame = require '../src/frame'

describe 'A frame', ->

  frame = null

  beforeEach ->
    frame = new Frame
    frame.throws.push(1)
    frame.throws.push(1)

  it 'holds two throws', ->
    expect(frame.throws.length).to.equal 2

  it 'provides a total', ->
    expect(frame.total()).to.equal 2

describe 'Bonus aspect of a frame', ->

  frame = null

  beforeEach ->
    frame = new Frame

  it 'has an index', ->
    expect(frame.index).to.equal 0

  it 'indicates a spare has been achieved', ->
    frame.throws.push(5)
    frame.throws.push(5)
    expect(frame.isSpare()).to.equal true

  it 'indicates a strike too', ->
    frame.throws.push(10)
    expect(frame.isStrike()).to.equal true
