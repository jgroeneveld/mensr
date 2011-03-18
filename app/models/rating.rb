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

  has_one :action, as: :affected, dependent: :destroy

  after_save :update_ratings
  after_destroy :update_ratings

  after_save :update_action

  validates_inclusion_of :value, in: 1..5
  validate :ratings_count_by_user, on: :create

  def ratings_count_by_user
    return if !user

    count = ratings_on_same_day_by_same_user
    if count >= 2
      errors.add(:user,"Too many votes by this user on this date")
    end
  end

  private

  def ratings_on_same_day_by_same_user
    self.user.dish_ratings.count(joins: :dish, conditions: ["dishes.serve_date = ?", self.dish.serve_date])
  end

  def update_ratings
    self.dish.update_ratings
    self.dish.reload
  end

  def update_action
    action = self.action

    if !action
      action = Action.new
      action.user = self.user
      action.dish = self.dish
      action.affected = self

      action.kind = :new
    else
      action.kind = :edit
    end

    action.save!
  end

end
