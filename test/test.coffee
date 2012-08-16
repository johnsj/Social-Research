require "should"

describe "Basic", ()->
  it "should add 2 + 2", ()->
    result = 2 + 2
    result.should.eql 4

  it "should be 'Hello World'", ()->
    string = 'Hello World'
    string.should.eql 'Hello World'