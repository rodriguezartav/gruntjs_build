(function() {
  var index, should;

  should = require("should");

  index = require("../../public/js/web");

  describe("Basic Test", function() {
    return it("should respond web", function() {
      return index.testOk().should.equal("web");
    });
  });

}).call(this);
