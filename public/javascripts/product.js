var add_image_handlers = function() {
  $('ul.thumbnails li').eq(0).addClass('selected');
  $('ul.thumbnails li a').click(
    function() {
      $('#main-image img').attr('src', $(this).attr('href'));
      $('#main-image a').attr('href', $(this).attr('href'));
      $('ul.thumbnails li').removeClass('selected');
      $(this).parent('li').addClass('selected');
      return false;
    });
};