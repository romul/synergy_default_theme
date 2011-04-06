TaxonsHelper.module_eval do
  def taxon_preview(taxon, max=6)
    Rails.cache.fetch([taxon, 'preview'], :expires_in => LONG_INTERVAL) do
      taxon.active_products.includes(:master, :images).order("rand()").limit(max).all
    end
  end
end
