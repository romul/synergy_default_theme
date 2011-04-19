module Spree::BaseHelper
  def link_to_cart(text = t('cart'))
    return "" if current_page?(cart_path)
    css_class = nil
    if current_order.nil? or current_order.line_items.empty?
      text = "#{text}"
      css_class = 'empty'
    else
      text = "#{text}: (#{current_order.item_count})"
      css_class = 'full'
    end
    link_to text, cart_path, :class => css_class
  end
end
