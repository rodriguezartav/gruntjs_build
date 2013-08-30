(function() {
  var Index;

  Index = (function() {
    function Index() {}

    Index.testOk = function() {
      return "web";
    };

    return Index;

  })();

  if (typeof module !== "undefined" && module !== null) {
    module.exports = Index;
  }

}).call(this);
