var answerArray = new Array();
var correctArray = new Array();

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
    var correct_value = $('.answer_checkbox').last().val();
    answerArray.push(value);
    $('.sth').html(answerArray);
    $('#answerform').append(
      $('<input>', { type:'checkbox', class:'answer_checkbox', name:'quiz[correct]', value:"true", style:"position:relative; left:0; opacity:1; float:right;"})
      );
    $('#answerform').append(
      $('<input>', { type:'text', class:'foranswer'})
      );
  });
});

