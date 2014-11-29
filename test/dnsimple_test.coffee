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

  it 'registers a hear listener for "check domain (.*)"', ->
    expect(@robot.hear).to.have.been.calledWith(/check domain (.*)/i)
