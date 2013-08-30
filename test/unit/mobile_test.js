(function() {
  var index, should;

  should = require("should");

  index = require("../../public/js/mobile");

  describe("Basic Test", function() {
    return it("should respond mobile", function() {
      return index.testOk().should.equal("mobile");
    });
  });

}).call(this);
