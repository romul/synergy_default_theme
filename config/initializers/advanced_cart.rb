if Spree::AdvancedCart::Config.instance
  Spree::AdvancedCart::Config.set(:enable_shipping_cost_calculation => false)
end