Deface::Override.new(
    :virtual_path => "layouts/spree_application",
    :insert_bottom => "[data-hook='inside_head']",
    :text => "<%= stylesheet_link_tag('reviews.css') %>",
    :name => "sdt_sr_inside_head") if defined?(SpreeReviews)