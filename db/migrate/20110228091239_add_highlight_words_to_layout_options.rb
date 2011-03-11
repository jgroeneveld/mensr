class AddHighlightWordsToLayoutOptions < ActiveRecord::Migration
  def self.up
    add_column :layout_options, :like_words, :string, default: ""  
    add_column :layout_options, :dislike_words, :string, default: ""
  end

  def self.down
    remove_column :layout_options, :like_words
    remove_column :layout_options, :dislike_words
  end
end
