require 'spree_core'
require 'synergy_default_theme_hooks'

module SynergyDefaultTheme
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
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
