class HomeController < Spree::BaseController
  helper :products, :taxons

  def index
    @taxons = Rails.cache.fetch('homepage-taxons', :expires_in => LONG_INTERVAL) do
      home_taxonomy = get_taxonomies.find{|t| t.show_on_homepage? }
      home_taxonomy ? home_taxonomy.root.children : []
    end
  end
end
