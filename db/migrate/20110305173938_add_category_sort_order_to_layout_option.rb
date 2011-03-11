class AddCategorySortOrderToLayoutOption < ActiveRecord::Migration
  def self.up
    add_column :layout_options, :category_sort_order, :string
  end

  def self.down
    remove_column :layout_options, :category_sort_order
  end
end
