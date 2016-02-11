var answerArray = new Array();
var correctArray = new Array();

// 옆에 add 버튼 누를시
$(document).on('ready page:load', function(){
  $('.actions').click(function(){
    $('input:checkbox:not(:checked)').val("false");
    var value = $('.foranswer').last().val();
    var correct_value = $('.answer_checkbox').last().val();
    answerArray.push(value);
    correctArray.push(correct_value);
    $('.sth').html(answerArray);
    $('.sth').html(correctArray);
    $('#quiz_answers').val(JSON.stringify(answerArray));
    $('#quiz_correct').val(JSON.stringify(correctArray));
  });
  $('#plus').click(function(){
    $('input:checkbox:not(:checked)').val("false");
    var value = $('.foranswer').last().val();
    var correct_value = $('.answer_checkbox').last().val();
    answerArray.push(value);
    correctArray.push(correct_value);
    $('.sth').html(answerArray);
    $('.sth').html(correctArray);
    $('#answerform').append(
      $('<input>', { type:'checkbox', class:'answer_checkbox', name:'quiz_correct', value:"true", style:"position:relative; left:0; opacity:1; float:right;"})
      );
    $('#answerform').append(
      $('<input>', { type:'text', class:'foranswer'})
      );
  });
});

