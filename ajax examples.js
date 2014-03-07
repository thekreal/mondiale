$('.sel-cov').on('click',function(e){
  e.preventDefault();
  $('#cov-sel').html("ijfe");
  myUrl = $(this).attr('href');


  $.ajax({
    url: myUrl,
    type: 'POST'
  });

  });



$('.sel-pic').on('click',function(e){
  e.preventDefault();
  myUrl = $(this).attr('href');

  $.ajax({
    url: myUrl,
    type: 'POST'
  });

  });