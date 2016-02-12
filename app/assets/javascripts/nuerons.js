$(document).ready(function(){
  $('.collapsible').collapsible({
    accordion : false;
  });
});


var selected_answer = $('.collapsible-body input:checked').val();
var nueron_id = $('.hidden_nueron_id').val();
var quiz_id = $('.collapsible-body input:checked+.hidden_quiz_id').val();
var request = $.ajax({
//url: "/nueron/"+nueron_id+"/quizzes/
  url: "/quizzes/"+quiz_id+"/check?"+selected_answer,
  method: "POST",
  data: { nueron_id: nuero_id, id: quiz_id, answer: selected_answer},
  dataType: "html"
});

request.done(function(msg){
  $("#hihihi").html(msg);
});


$(document).ready(function(e) {

  $("form[ajax=true]").submit(function(e) {

    e.preventDefault();

    var form_data = $(this).serialize();
    var form_url = $(this).attr("action");
    var form_method = $(this).attr("method").toUpperCase();

    $("#loadingimg").show();

    $.ajax({
      url: form_url,
      type: form_method,
      data: form_data,
      cache: false,
      success: function(returnhtml){
        $("#result").html(returnhtml);
        $("#loadingimg").hide();
      }
    });

  });

