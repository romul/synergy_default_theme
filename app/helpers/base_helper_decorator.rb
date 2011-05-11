Spree::BaseHelper.module_eval do
  def link_to_cart(text = t('cart'))
    css_class = nil
    if current_order.nil? or current_order.line_items.empty?
      text = "#{text}"
      css_class = 'empty'
    else
      text = "#{text} (#{current_order.item_count})"
      css_class = 'full'
    end
    link_to text, cart_path, :class => css_class
  end
  
  # Outputs the corresponding flash message if any are set
  def flash_messages
    result_content = %w(notice warning error).map do |msg|
      content_tag(:script,
      		"$.jGrowl(\"#{flash[msg.to_sym]}\", { header: '#{t(msg, :default => msg).mb_chars.titleize}', sticky: true, theme: '#{msg}' });".html_safe
			) unless flash[msg.to_sym].blank?
    end.join("\n").html_safe
    flash.clear
    
    result_content
  end
end
