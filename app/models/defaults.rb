# == Schema Information
# Schema version: 20110310205218
#
# Table name: defaults
#
#  id                  :integer         not null, primary key
#  category_sort_order :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class Defaults < ActiveRecord::Base
end
