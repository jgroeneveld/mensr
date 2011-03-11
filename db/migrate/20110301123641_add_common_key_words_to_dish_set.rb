class AddCommonKeyWordsToDishSet < ActiveRecord::Migration
  def self.up
    add_column :dish_sets, :common_key_words, :string, default: ""
  end

  def self.down
    remove_column :dish_sets, :common_key_words
  end
end
