# == Schema Information
# Schema version: 20110305173938
#
# Table name: dish_sets
#
#  id               :integer         not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  common_key_words :string(255)     default("")
#  average_rating   :integer         default(0)
#  ratings_count    :integer         default(0)
#  mensa_id         :integer
#

class DishSet < ActiveRecord::Base
  MIN_KEY_WORD_MATCH_PERCENTAGE = 0.8

  has_many :dishes
  belongs_to :mensa

  def common_key_words_array
    self.common_key_words.split("|").collect{ |e| e.strip }
  end

  def common_key_words_array=array
    self.common_key_words = array.join("|")
  end

  def matches? dish
    match_percentage(dish) >= MIN_KEY_WORD_MATCH_PERCENTAGE
  end

  def match_percentage dish
    matches = dish.description.scan(/#{self.common_key_words}/).count

    matches.to_f/self.common_key_words_array.count.to_f
  end

  def update_average_rating!
    sum = 0
    rates = 0

    self.dishes.each do |d|
      d.ratings.each do |r|
        sum += r.value
        rates += 1
      end
    end

    self.average_rating = (sum.to_f/rates.to_f).round
    self.ratings_count = rates
    self.save!
  end

  def self.find_matching_set_for dish
    dish_sets = DishSet.where(mensa_id: dish.mensa_id)
    best_set = nil

    dish_sets.each do |ds|
      best_set = ds if !best_set || (ds.match_percentage(dish) > best_set.match_percentage(dish))
    end

    best_set if best_set && best_set.matches?(dish)
  end
end
