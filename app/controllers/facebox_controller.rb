class FaceboxController < ApplicationController
  include RatingsHelper
  layout 'facebox'

  def dish_photo
    @photo = DishPhoto.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def ratings_for_dish
    dish = Dish.find(params[:id])
    url = chart_for_ratings dish.ratings

    render template: 'facebox/ratings_distribution', locals: {url: url}
  end

  def ratings_for_dish_set
    dish_set = DishSet.find(params[:id])
    url = chart_for_ratings dish_set.ratings

    render template: 'facebox/ratings_distribution', locals: {url: url}
  end
end