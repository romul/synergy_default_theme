Deface::Override.new(
    :virtual_path => "layouts/spree_application",
    :insert_bottom => "[data-hook='footer_right']",
    :text => '<%= javascript_include_tag("store/jquery.rating.js") %>
              <%= javascript_tag("$(document).ready(function(){$(\'.stars\').rating({required:true});});") %>',
    :name => "sdt_sr_footer_right") if defined?(SpreeReviews)