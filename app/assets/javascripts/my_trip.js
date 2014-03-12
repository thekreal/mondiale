function myTrip() {
  var coverPhoto = $('.cover-photo');
  if (coverPhoto.length) {
    imageUrl = coverPhoto.data('imageUrl');
    coverPhoto.css({
      background: 'url(' + imageUrl + ') no-repeat border-box center center scroll',
      backgroundSize: 'cover'
    })
  }
}
