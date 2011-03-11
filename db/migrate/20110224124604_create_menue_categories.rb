class CreateMenueCategories < ActiveRecord::Migration
  def self.up
    create_table :menue_categories do |t|
      t.string :name
      t.integer :mensa_id

      t.timestamps
    end
  end

  def self.down
    drop_table :menue_categories
  end
end
