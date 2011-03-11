class AlterDishCategoryTypeToString < ActiveRecord::Migration
  def self.up
    remove_column :dishes, :category
    add_column :dishes, :category, :string
  end

  def self.down
    remove_column :dishes, :category
    add_column :dishes, :category, :integer    
  end
end
