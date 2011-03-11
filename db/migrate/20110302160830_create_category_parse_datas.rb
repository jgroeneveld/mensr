class CreateCategoryParseDatas < ActiveRecord::Migration
  def self.up
    create_table :category_parse_datas do |t|
      t.integer :row
      t.integer :col, default: 1
      t.integer :menue_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_parse_datas
  end
end
