$(document).on('ready page:load', function() {

  $("#task-form").bind("ajax:success", function(event,xhr,status){
    $('.title').val('');
    $("#task-table").load( "http://localhost:3000/tasks #task-table");
    $('.subtask').hide();
  });

  $('.subtask').hide();

  $('.btntoggle').on('click', function () {
    var idOfParent = $(this).parents('tr').attr('id');
    $('tr#subtasktr'+idOfParent).toggle('slow');
  });

});
