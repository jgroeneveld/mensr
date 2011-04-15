class FaceboxController < ApplicationController
  include RatingsHelper
  layout 'facebox'

  def dish_photo
    @photo = DishPhoto.find(params[:id])
    if @photo.uploader != nil
      @uploadername = @photo.uploader.name
    else
      @uploadername = "'Unbekannt'"
    end

    respond_to do |format|
      format.html
    end
  end

  def ratings_for_dish
    dish = Dish.find(params[:id])
    self.ratings_for_obj dish
  end

  def ratings_for_dish_set
    dish_set = DishSet.find(params[:id])
    self.ratings_for_obj dish_set
  end

  def ratings_for_obj obj
    distributions = distributions_for_ratings obj.ratings

    render template: 'facebox/ratings_distribution', locals: {distributions: distributions, average:obj.average_rating}
  end
end