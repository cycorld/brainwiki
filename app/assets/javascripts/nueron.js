$(document).ready(function(){
  $('.collapsible').collapsible({
    accordion : false
  });
});

$(document).ready(function(e) {

  $("form[ajax=true]").submit(function(e) {

    e.preventDefault();

    var form_data = $(this).serialize();
    var form_url = $(this).attr("action");
    var form_method = $(this).attr("method").toUpperCase();
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
