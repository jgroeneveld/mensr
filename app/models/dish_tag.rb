# == Schema Information
# Schema version: 20110223131413
#
# Table name: dish_tags
#
#  id         :integer         not null, primary key
#  dish_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  kind       :string(255)
#

class DishTag < ActiveRecord::Base  
  include DishTagsHelper
  
  belongs_to :dish
  validates_inclusion_of :kind, in: ALLOWED_KINDS
  
  def kind
    read_attribute(:kind).to_sym
  end
  
  def kind= (value)
    write_attribute(:kind, value.to_s)
  end
end
