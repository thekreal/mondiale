// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// Initializer
$(document).ready(function() {
  flashAlertEffect();
  dropdownListBtn();

$('.del-pic').on('click',function(e){
  e.preventDefault();
  myUrl = $(this).att('href');

	$.ajax({
		url: myUrl,
		type: 'POST'
	});

	});

$(window).scroll(function() {

    if ($(this).scrollTop() > 300) {
        $( ".navbar" ).css( { backgroundColor: "rgba( 0, 0, 0, 0.8 )" } );
    } else if ($(this).scrollTop() < 300) {
        $( ".navbar" ).css(  { backgroundColor: "rgba( 80, 80, 80, 0.4 )" });
    }
	});

});