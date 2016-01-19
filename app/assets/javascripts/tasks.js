$(document).on('ready page:load', function() {
  $("#task-form").bind("ajax:success", function(event,xhr,status){
    $('.title').val('');
    $("#task-table").load( "http://localhost:3000/tasks #task-table");
  });
});
