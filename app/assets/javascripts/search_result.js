function searchResult() {
  var result = $('.search-result');
  if (result.length) {
    result.each(function() {
      console.log(this)
      $(this).outerHeight(windowHeight() / 2);
    })

  }
}