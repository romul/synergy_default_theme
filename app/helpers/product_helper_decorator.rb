ProductsHelper.module_eval do
  def product_description(product)
    raw(product.description)
  end

end
