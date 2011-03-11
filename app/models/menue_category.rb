# == Schema Information
# Schema version: 20110224155025
#
# Table name: menue_categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  mensa_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class MenueCategory < ActiveRecord::Base
  include DishesHelper
  belongs_to :mensa
  has_many :parse_datas, class_name: "CategoryParseData"
  has_many :dishes

  validates_inclusion_of :name, in: ALLOWED_CATEGORIES

  def name
    read_attribute(:name).to_sym
  end

  def name= (value)
    write_attribute(:name, value.to_s)
  end

end
