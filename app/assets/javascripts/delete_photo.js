function deletePictureBtn() {
  var delBtn = $('.del-pic');

  if (delBtn.length) {
    delBtn.on('click', function(e) {
      e.preventDefault();
      myUrl = $(this).attr('href');
      $.ajax({ url: myUrl, type: 'POST' })
    })
  }

}
