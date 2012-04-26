Deface::Override.new(
    :virtual_path => "admin/configurations/index",
    :insert_bottom => "[data-hook='admin_configurations_menu']",
    :text => "<%= configurations_menu_item(t('reviews.review_settings'), 
              admin_review_settings_path, t('reviews.manage_review_settings')) %>",
    :name => "sdt_sr_admin_configurations_menu") if defined?(SpreeReviews)