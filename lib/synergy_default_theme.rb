require 'spree_core'
require 'synergy_default_theme_hooks'
require 'spree_reviews_hooks' if defined?(SpreeReviews)
require 'spree_compare_products_hooks' if defined?(SpreeCompareProducts)

module SynergyDefaultTheme
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      Admin::PagesController.cache_sweeper :page_sweeper
      Admin::TrackersController.cache_sweeper :tracker_sweeper
      
      if defined?(Spree::RecentlyViewed) && Spree::RecentlyViewed::Config.instance
        Spree::RecentlyViewed::Config.set :recently_viewed_products_max_count => 3
      end
      
      if Spree::Config.instance
        Spree::Config.set :products_per_page => 9
      end

      Image.attachment_definitions[:attachment].merge!({
        :styles => {
                :mini    => '40x40>',
                :small   => '120x120>',
                :product => '200x200>',
                :large   => '600x600>'
        }
      })
    end

    config.to_prepare &method(:activate).to_proc
  end
end
