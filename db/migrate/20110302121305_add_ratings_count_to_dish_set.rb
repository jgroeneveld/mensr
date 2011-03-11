class AddRatingsCountToDishSet < ActiveRecord::Migration
  def self.up
    add_column :dish_sets, :ratings_count, :integer, default: 0
  end

  def self.down
    remove_column :dish_sets, :ratings_counts
  end
end
