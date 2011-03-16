# == Schema Information
# Schema version: 20110305173938
#
# Table name: dishes
#
#  id                :integer         not null, primary key
#  price_a           :float
#  price_b           :float
#  description       :string(255)
#  serve_date        :date
#  mensa_id          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  average_rating    :integer         default(0)
#  dish_set_id       :integer
#  menue_category_id :integer
#

class Dish < ActiveRecord::Base
  MAX_NUMBER_OF_PHOTOS = 9

  include DishesHelper
  class NotServedYetError < StandardError; end

  belongs_to :mensa
  belongs_to :dish_set
  belongs_to :menue_category
  has_many :photos, class_name: 'DishPhoto'

  has_many :tags, class_name: 'DishTag'
  has_many :ratings

  validates_length_of :description, minimum: 5

  before_save :create_set

  validates_uniqueness_of :description,
    scope: :serve_date,
    message: "There is already a dish with the same description on this day"

  def create_set
    unless self.dish_set
      self.dish_set = DishSet.create(mensa_id: self.mensa_id)
      self.dish_set.common_key_words_array = self.key_words
      self.dish_set.save!
    end
  end

  def prioritized_photos
    ps = self.photos.order("created_at DESC").limit(MAX_NUMBER_OF_PHOTOS)

    if ps.count < MAX_NUMBER_OF_PHOTOS
      other_dishes = self.dish_set.dishes.where("id != ?", self.id).order("created_at DESC")

      other_dishes.each do |d|
        ps |= d.photos.limit(MAX_NUMBER_OF_PHOTOS - ps.count)

        if ps.count >= MAX_NUMBER_OF_PHOTOS
          break
        end
      end
    end

    ps
  end

  def rate! value, user
    if self.serve_date > Time.now.to_date
      raise NotServedYetError
    end


    rating = self.ratings.where(user_id: user.id).first

    if !rating
      rating = Rating.new
      rating.user = user
      rating.dish = self
    end

    rating.value = value
    rating.save!

    self.average_rating = ratings.average("value").to_f.round
    self.save!

    self.dish_set.update_average_rating!

    self.average_rating
  end

  def key_words
    self.description.scan(/\b[A-Z]\w+/)
  end

  def assign_best_set!
    old_set = self.dish_set

    best_set = DishSet.find_matching_set_for self
    self.dish_set = best_set

    self.save!

    old_set.destroy if old_set && old_set.dishes.blank?
  end

  def not_real_dish?
    self.description[NOT_REAL_DISH_REGEX]
  end
end
