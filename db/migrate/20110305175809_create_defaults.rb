class CreateDefaults < ActiveRecord::Migration
  def self.up
    create_table :defaults do |t|
      t.string :category_sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :defaults
  end
end
