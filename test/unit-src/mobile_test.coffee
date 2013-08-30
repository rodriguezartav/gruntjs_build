should = require("should")

index = require "../../public/js/mobile" 

describe "Basic Test", ->

  it "should respond mobile" , ->
    index.testOk().should.equal "mobile" 