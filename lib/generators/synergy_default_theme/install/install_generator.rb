module SynergyDefaultTheme
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file "app/assets/javascripts/store/all.js", "//= require store/jquery.jgrowl.min\n"+
                                                           "//= require store/jquery.tools.min"
      end

      def add_stylesheets
        inject_into_file "app/assets/stylesheets/store/all.css", 
                          " *= require store/jquery.jgrowl\n"+
                          " *= require store/style\n", 
                          :before => /\*\//, 
                          :verbose => true
      end

      def add_favicon
        run 'rake synergy_default_theme:install:assets'
      end

      def add_migrations
        run 'rake railties:install:migrations FROM=synergy_default_theme'
      end

      def run_migrations
         res = ask "Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'rake db:migrate'
         else
           puts "Skiping rake db:migrate, don't forget to run it!"
         end
      end
    end
  end
end