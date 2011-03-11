class AddMensaToDishSet < ActiveRecord::Migration
  def self.up
    add_column :dish_sets, :mensa_id, :integer
  end

  def self.down
    remove_column :dish_sets, :mensa_id
  end
end
