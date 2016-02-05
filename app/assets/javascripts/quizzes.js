var answerArray = new Array();

$(document).on('ready page:load', function(){
  $('.foranswer').pressEnter(function(){
    $('#answerform').append(
     $('<input>', { type:'text'})
      );
    var value = this.value;
    answerArray.push(value);
   $('.sth').html(answerArray);
  });
});

// 옆에 add 버튼 누를시
$(document).on('ready page:load', function(){
  $('.actions').click(function(){
    var value = $('.foranswer').last().val();
    answerArray.push(value);
    $('.sth').html(answerArray);
    $('#quiz_answers').val(JSON.stringify(answerArray));
  });
  $('#plus').click(function(){
    var value = $('.foranswer').last().val();
    answerArray.push(value);
    $('.sth').html(answerArray);
    $('#answerform').append(
      $('<input>', { type:'text', class:'foranswer'})
      );
  });
});

// press enter -> create event
$.fn.pressEnter = function(fn) {
  return this.each(function() {
    $(this).bind('enterPress', fn);
    $(this).keyup(function(e){
      if(e.keyCode == 13)
    {
      $(this).trigger("enterPress");
    }
    })
  });
};
