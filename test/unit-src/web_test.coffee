should = require("should")

index = require "../../public/js/web" 

describe "Basic Test", ->

  it "should respond web" , ->
    index.testOk().should.equal "web"