$(function(){

  $('.headerLeft .fa-bars').click(function(){
      $('.headerLeftList').slideToggle();
  })
  $('.headerLeftListRandomBtn').click(function(){
    $('.headerLeftListBtnRandom').slideToggle();
  });

  $('.headerRight .iconImageSmall,.fa-user-circle').click(function(){
    $('.headerRightList').slideToggle();
  })

});