class ChangeCategoryInDish < ActiveRecord::Migration
  def self.up
    remove_column :dishes, :category
    add_column :dishes, :menue_category_id, :integer
  end

  def self.down
    add_column :dishes, :category, :string
    remove_column :dishes, :menue_category_id
  end
end
