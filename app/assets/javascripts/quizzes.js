var answerArray = new Array();

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

