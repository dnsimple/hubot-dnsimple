chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'dnsimple', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/dnsimple')(@robot)

  it 'registers a respond listener for "check domain (.+)$"', ->
    expect(@robot.respond).to.have.been.calledWith(/check domain (.+)$/i)
