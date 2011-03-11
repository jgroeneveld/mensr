class AddAverageRatingToDish < ActiveRecord::Migration
  def self.up
    add_column :dishes, :average_rating, :integer, default: 0
  end

  def self.down
    remove_column :dishes, :average_rating
  end
end
