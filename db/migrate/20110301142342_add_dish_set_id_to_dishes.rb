class AddDishSetIdToDishes < ActiveRecord::Migration
  def self.up
    add_column :dishes, :dish_set_id, :integer
  end

  def self.down
    remove_column :dishes, :dish_set_id
  end
end
