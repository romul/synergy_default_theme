var add_image_handlers = function() {
  $('ul.thumbnails li').eq(0).addClass('selected');
  $('ul.thumbnails li a').click(function(e) {
    var selectedThumb = $(this);
    $('#main-image img').attr('src', selectedThumb.attr('href'));
    $('ul.thumbnails li').removeClass('selected');
    $(this).parent('li').addClass('selected');

    $('#main-image a').attr('large', selectedThumb.attr('large'));
    $('#large_image_overlay .large_image img').attr('src', selectedThumb.attr('large'));
    e.preventDefault();
  });

  $('#main-image a').click(function() {
    var thumbs = getThumbnails();

    if (thumbs.size() > 0) {
      var large_image = $('#large_image_overlay .large_image img');
      var overlay = $('#large_image_overlay').data('overlay');
      var thumbnails = $('#large_image_overlay .thumbs_gallery ul');

      $('#large_image_overlay .thumbs_gallery').show();
      thumbnails.empty();
      thumbs.each(function(index, thumb) {
        thumbnails.append('<li><a href="' + thumb.large + '"><img src="' + thumb.thumb + '" /></a></li>');
      });

      large_image.load(function() {
        large_image.animate({ 'opacity': 1 }, 200);
      });


      $('#large_image_overlay .thumbs_gallery a').click(function(e) {
        var selectedThumb = $(this);
        if (large_image.attr('src') != selectedThumb.attr('href'))
        large_image.animate({ 'opacity': 0.01 }, 200, function() {
          large_image.attr('src', selectedThumb.attr('href'));
        });
        e.preventDefault();
      });
    }
    else {
      $('#large_image_overlay .thumbs_gallery').hide();
    }
  }).overlay({
    mask: {
      color: 'black',
      opacity: 0.3
    },
    onBeforeClose: function() {
      $('#large_image_overlay .large_image img').unbind('load');
    },
    fixed: false
  });
};

function getThumbnails() {
  return $('ul.thumbnails li').map(function() {
    return {
      'thumb': $(this).find('img').attr('src'),
      'large': $(this).find('a').attr('large')
    };
  });
}
