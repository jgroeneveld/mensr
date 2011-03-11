class CreateDishTags < ActiveRecord::Migration
  def self.up
    create_table :dish_tags do |t|
      t.string :image_url
      t.string :name
      t.integer :dish_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dish_tags
  end
end
