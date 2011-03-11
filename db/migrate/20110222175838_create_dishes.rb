class CreateDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.integer :category
      t.float :price_a
      t.float :price_b
      t.string :description
      t.date :serve_date
      t.integer :mensa_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dishes
  end
end
