class ChangeColumnTitleInReviews < ActiveRecord::Migration
  def self.up
    change_column(:reviews, :title, :string, :default => '-')
  end

  def self.down
    change_column(:reviews, :title, :string, :default => nil)
  end
end
