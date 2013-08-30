(function() {
  var Index;

  Index = (function() {
    function Index() {}

    Index.testOk = function() {
      return "mobile";
    };

    return Index;

  })();

  if (typeof module !== "undefined" && module !== null) {
    module.exports = Index;
  }

}).call(this);
