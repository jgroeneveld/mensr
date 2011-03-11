class AddAverageRatingToDishSet < ActiveRecord::Migration
  def self.up
    add_column :dish_sets, :average_rating, :integer, default: 0
  end

  def self.down
    remove_column :dish_sets, :average_rating
  end
end
