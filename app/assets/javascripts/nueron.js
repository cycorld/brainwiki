$(document).ready(function(){
  $('.collapsible').collapsible({
    accordion : false
  });
});


$(document).ready(function(e) {
  $('#new_quiz_history').submit(function(e) {
//  var quiz_id = $('.collapsible-header.'+quiz_id+'.active').next('.collapsible-body').find('input:checked');
//    var quiz_id = $('.collapsible-header.'+quiz_id+'.active').data("id");
    var quiz_id = $('.collapsible-header.active').data("id");
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
          $('.collapsible-header.'+quiz_id).css("border", "2px solid yellowgreen");
          $('.collapsible-header.'+quiz_id).prop('disabled',true);
          $('.collapsible.popout li').removeClass("active");
          $('.collapsible-body').css("display","none");
        } else {
          Materialize.toast('오답', 5000)
          $('.collapsible-header.'+quiz_id).css("border", "2px solid red");
        }
      }
    });

  });
});
