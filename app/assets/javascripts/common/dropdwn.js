$(function(){

  $('.headerLeft .fa-bars').click(function(){
      $('.headerLeftList').slideToggle();
  })
  $('.headerLeftListRandomBtn').click(function(){
    $('.headerLeftListBtnRandom').slideToggle();
  });

  $('.headerRight .iconImageSmall,.fa-angle-double-down').click(function(){
    $('.headerRightList').slideToggle();
  })

});