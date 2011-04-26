class SynergyDefaultThemeHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_inside_taxonomy_form, 'admin/taxonomies/show_on_homepage_field'

  remove :continue_shopping_or_empty_cart
end