class AddAffectedToAction < ActiveRecord::Migration
  def self.up
    add_column :actions, :affected_id, :integer
    add_column :actions, :affected_type, :string
  end

  def self.down
    remove_column :actions, :affected_id
    remove_column :actions, :affected_type
  end
end
