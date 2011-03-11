class AlterDishTags < ActiveRecord::Migration
  def self.up
    remove_column :dish_tags, :image_url
    remove_column :dish_tags, :name
    add_column :dish_tags, :kind, :string
  end

  def self.down
    add_column :dish_tags, :image_url, :string
    add_column :dish_tags, :name, :string
    remove_column :dish_tags, :string
  end
end
