

$('#chapters-list').sortable(
  {
    axis: "y",
    update: function(event, ui){
      var data = $(this).sortable('serialize');

      $.ajax({
        data: data,
        url: "/trips/sort_chapter_items",
        type: 'POST'
      });

    }//end function argument
  } //end argument
); // end sortable