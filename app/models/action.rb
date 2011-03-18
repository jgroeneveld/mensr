# == Schema Information
# Schema version: 20110318143110
#
# Table name: actions
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  kind        :string(255)
#  dish_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  object_id   :integer
#  object_type :string(255)
#

class Action < ActiveRecord::Base
  include ActionsHelper

  belongs_to :user
  belongs_to :dish
  belongs_to :affected, polymorphic: true # rating, photo etc.

  validates_inclusion_of :kind, in: ALLOWED_KINDS

  def kind
    read_attribute(:kind).to_sym
  end

  def kind= (value)
    write_attribute(:kind, value.to_s)
  end
end
