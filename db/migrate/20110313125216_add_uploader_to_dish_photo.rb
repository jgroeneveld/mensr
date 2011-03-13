class AddUploaderToDishPhoto < ActiveRecord::Migration
  def self.up
    add_column :dish_photos, :uploader_id, :integer
  end

  def self.down
    remove_column :dish_photos, :uploader_id
  end
end
