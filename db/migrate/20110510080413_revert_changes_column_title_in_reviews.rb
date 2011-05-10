class RevertChangesColumnTitleInReviews < ActiveRecord::Migration
  def self.up
    if table_exists?(:reviews)
      change_column(:reviews, :title, :string, :default => nil)
    end
  end

  def self.down
    if table_exists?(:reviews)
      change_column(:reviews, :title, :string, :default => '-')
    end
  end
end
