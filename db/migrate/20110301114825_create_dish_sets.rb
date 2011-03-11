class CreateDishSets < ActiveRecord::Migration
  def self.up
    create_table :dish_sets do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :dish_sets
  end
end
