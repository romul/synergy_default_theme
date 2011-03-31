module Spree::BaseHelper
  def link_to_cart(text = t('cart'))
    return "" if current_page?(cart_path)
    css_class = nil
    if current_order.nil? or current_order.line_items.empty?
      text = "#{text}: (#{t('empty')})"
      css_class = 'empty'
    else
      text = "#{text}: (#{current_order.item_count})"
      css_class = 'full'
    end
    link_to text, cart_path, :class => css_class
  end

  def order_price(order, options={})
    options.assert_valid_keys(:format_as_currency, :show_vat_text, :show_price_inc_vat)
    options.reverse_merge! :format_as_currency => true, :show_vat_text => true

    # overwrite show_vat_text if show_price_inc_vat is false
    options[:show_vat_text] = Spree::Config[:show_price_inc_vat]

    amount =  order.item_total
    amount += Calculator::Vat.calculate_tax(order) if Spree::Config[:show_price_inc_vat]

    options.delete(:format_as_currency) ? number_to_currency(amount, :precision => 0) : amount
  end

  def format_price(price, options={})
    options.assert_valid_keys(:show_vat_text)
    options.reverse_merge! :show_vat_text => Spree::Config[:show_price_inc_vat]
    formatted_price = number_to_currency(price, :precision => 0)
    if options[:show_vat_text]
      I18n.t(:price_with_vat_included, :price => formatted_price)
    else
      formatted_price
    end
  end
end