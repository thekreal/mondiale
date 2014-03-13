function coverPhoto() {
  var coverPhoto = $('.cover-photo');
  if (coverPhoto.length) {
    coverPhoto.each(function() {
      imageUrl = $(this).data('imageUrl')
      $(this).css({
        background: 'url(' + imageUrl + ') no-repeat border-box center center scroll',
        backgroundSize: 'cover'
      })
    })
  }
}