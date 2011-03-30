class AddShowOnMainPageFlagToTaxonomies < ActiveRecord::Migration
  def self.up
    add_column :taxonomies, :show_on_homepage, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :taxonomies, :show_on_homepage
  end
end
