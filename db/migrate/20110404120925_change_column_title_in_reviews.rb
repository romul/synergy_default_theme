class ChangeColumnTitleInReviews < ActiveRecord::Migration
  def self.up
    change_column_default(:reviews, :title, '-')
  end

  def self.down
    change_column_default(:reviews, :title, nil)
  end
end
