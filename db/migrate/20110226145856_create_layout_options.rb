class CreateLayoutOptions < ActiveRecord::Migration
  def self.up
    create_table :layout_options do |t|
      t.integer :user_id
      t.boolean :show_tags, default: true
      t.boolean :show_price_a, default: true
      t.boolean :show_price_b, default: true
      t.boolean :show_rating, default: true

      t.timestamps
    end
  end

  def self.down
    drop_table :layout_options
  end
end
