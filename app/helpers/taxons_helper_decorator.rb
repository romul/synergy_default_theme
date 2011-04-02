TaxonsHelper.module_eval do
  def taxon_preview(taxon, max=6)
    products = taxon.active_products.limit(max)
  end
end
