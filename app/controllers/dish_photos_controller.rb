class DishPhotosController < ApplicationController
  before_filter :authenticate_user!, only: [:destroy]

  def new
    if !current_user
      redirect_to login_path
    else
      @photo = DishPhoto.new
      @photo.dish = Dish.find(params[:dish_id])

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @photo }
      end
    end
  end

  def create
    @photo = DishPhoto.new(params[:dish_photo])
    @photo.uploader = current_user

    if @photo.save
      redirect_to @photo.dish, notice: "Foto erfolgreich hochgeladen."
    else
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    if !current_user.admin?
      flash[:alert] = t(:admin_only)
      redirect_to today_path
      return
    end

    @photo = DishPhoto.find(params[:id])

    if @photo.destroy
      redirect_to @photo.dish, notice: "Foto entfernt."
    else
      redirect_to @photo.dish, notice: "Fehler."
    end
  end

end
