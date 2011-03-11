# == Schema Information
# Schema version: 20110302160830
#
# Table name: category_parse_datas
#
#  id                :integer         not null, primary key
#  row               :integer
#  col               :integer         default(1)
#  menue_category_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class CategoryParseData < ActiveRecord::Base
  belongs_to :menue_category
end
