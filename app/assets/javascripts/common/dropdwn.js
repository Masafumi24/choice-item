$(function(){

  $('.fa-bars').click(
    function(){
      $(".headerLeftList").slideDown();
    }
  );

  $('.headerLeftListRandomBtn').click(
    function(){
      $(".headerLeftListBtnRandom").slideDown();
    }
  );

  $('body').click(function() {
    if ($('.headerLeft').click == false) {
      $('ul').removeClass('headerLeftList');
      // $('ul').slideUp('headerLeft');
    }
  });

});