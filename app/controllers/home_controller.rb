class HomeController < Spree::BaseController
  helper :products, :taxons

  def index
    @homepage_taxonomies = Taxonomy.where(:show_on_homepage => true)
  end
end