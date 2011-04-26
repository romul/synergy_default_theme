var add_image_handlers = function() {
  $("#main-image").data('selectedThumb', $('#main-image img').attr('src'));
  $('ul.thumbnails li').eq(0).addClass('selected');
  $('ul.thumbnails li a').click(
    function() {
      $("#main-image").data('selectedThumb', $(this).attr('href'));
      $('ul.thumbnails li').removeClass('selected');
      $(this).parent('li').addClass('selected');
      return false;
    }).hover(
    function() {
      $('#main-image img').attr('src', $(this).attr('href').replace('mini', 'product'));
    },
    function() {
      $('#main-image img').attr('src', $("#main-image").data('selectedThumb'));
    }
  );
};