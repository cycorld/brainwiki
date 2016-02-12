$(document).ready(function(){
  $('.collapsible').collapsible({
    accordion : false
  });
});


$(document).ready(function(e) {
  $("form[ajax=true]").submit(function(e) {
    var quiz_id = $('input:checked').siblings('.hidden_quiz_id').val();
    e.preventDefault();
    var form_data = $(this).serialize();
    var form_url = $(this).attr("action");
    var form_method = $(this).attr("method").toUpperCase();
    console.log($('.collapsible-header.'+quiz_id));
    $('.collapsible-header.'+quiz_id).css("border", "2px solid yellowgreen");
    $.ajax({
      url: form_url,
      type: form_method,
      data: form_data,
      cache: false,
      success: function(res){
        if(res.success) {
          Materialize.toast('정답', 5000)
        } else {
          Materialize.toast('오답', 5000)
          //$("#hihihi").html("틀림");
        }
      }
    });

  });
});
