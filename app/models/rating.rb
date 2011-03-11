# == Schema Information
# Schema version: 20110224155025
#
# Table name: ratings
#
#  id         :integer         not null, primary key
#  dish_id    :integer
#  value      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :dish

  validates_inclusion_of :value, in: 1..5
  validate :ratings_count_by_user, on: :create

  def ratings_count_by_user
    return if !user

    count = ratings_on_same_day_by_same_user.count
    if count >= 2
      errors.add(:user,"Too many votes by this user on this date")
    end
  end

  private

  def ratings_on_same_day_by_same_user
    self.user.dish_ratings.joins(:dish).where(dishes: {serve_date: self.dish.serve_date})
  end

end
