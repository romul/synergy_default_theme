var add_image_handlers = function() {
  $('ul.thumbnails li').eq(0).addClass('selected');
  $('ul.thumbnails li a').click(function(e) {
    var selectedThumb = $(this);
    $('#main-image img').attr('src', selectedThumb.attr('product'));
    $('ul.thumbnails li').removeClass('selected');
    $(this).parent('li').addClass('selected');

    $('#main-image a').attr('large', selectedThumb.attr('href'));
    $('#large_image_overlay .large_image img').attr('src', selectedThumb.attr('href'));
    e.preventDefault();
  });

  $('#main-image a').click(function() {
    var thumbs = getThumbnails();

    if (thumbs.size() > 0) {
      var large_image = $('#large_image_overlay .large_image img');
      var overlay = $('#large_image_overlay').data('overlay');
      var overlay_box = $('#large_image_overlay');
      var container = $('#large_image_overlay .overlay_container');
      var thumbnails = $('#large_image_overlay .thumbs_gallery ul');
      var w = $(window);

      $('#large_image_overlay .thumbs_gallery').show();
      thumbnails.empty();
      thumbs.each(function(index, thumb) {
        thumbnails.append('<li><a href="' + thumb.large + '"><img src="' + thumb.thumb + '" /></a></li>');
      });

      large_image.load(function() {
        var height = container.height(), width = Math.max(large_image.width(), thumbnails.width());
        overlay_box.animate({
          'width': width,
          'height': height,
          'left': Math.max((w.width() - width) / 2 - 11, 0) + 'px',
          'top': Math.max((w.height() - height) / 2 - 11, 0) + 'px'
        }, 200, function() {
          container.animate({ 'opacity': 1 }, 200);
        });
      });

      $('#large_image_overlay .thumbs_gallery a').click(function(e) {
        var selectedThumb = $(this);
        container.animate({ 'opacity': 0.01 }, 200, function() {
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
    onBeforeLoad: function() {
      $('#large_image_overlay .large_image img').attr('src', $('#main-image a').attr('large'));
    },
    onLoad: function() {
      var overlay_box = $('#large_image_overlay');
      overlay_box.css({
        'width': overlay_box.width(),
        'height': overlay_box.height()
      });
    },
    onBeforeClose: function() {
      $('#large_image_overlay .large_image img').unbind('load');
      var overlay_box = $('#large_image_overlay');
      overlay_box.css({
        'width': '',
        'height': ''
      });
    },
    top: 'center'
  });
};


function getThumbnails() {
  return $('ul.thumbnails li').map(function() {
    return {
      'thumb': $(this).find('img').attr('src'),
      'large': $(this).find('a').attr('href')
    };
  });
}