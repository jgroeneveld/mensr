class FaceboxController < ApplicationController
  layout 'facebox'

  def dish_photo
    @photo = DishPhoto.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
end