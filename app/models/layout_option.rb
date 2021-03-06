# == Schema Information
# Schema version: 20110305173938
#
# Table name: layout_options
#
#  id                  :integer         not null, primary key
#  user_id             :integer
#  show_tags           :boolean         default(TRUE)
#  show_price_a        :boolean         default(TRUE)
#  show_price_b        :boolean         default(TRUE)
#  show_rating         :boolean         default(TRUE)
#  created_at          :datetime
#  updated_at          :datetime
#  like_words          :string(255)     default("")
#  dislike_words       :string(255)     default("")
#  category_sort_order :string(255)
#

class LayoutOption < ActiveRecord::Base
  belongs_to :user


  def like_words_array
    self.like_words.split(",").collect{ |e| e.strip }
  end

  def like_words_array= (a)
    self.like_words = a.join(',')
  end


  def dislike_words_array
    self.dislike_words.split(",").collect{ |e| e.strip }
  end

  def dislike_words_array= (a)
    self.dislike_words = a.join(',')
  end


  def category_sort_order_array
    self.category_sort_order.split(",").collect{ |e| e.to_i }
  end

  def category_sort_order_array= (a)
    self.category_sort_order = a.join(',')
  end
end
