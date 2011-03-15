# coding: utf-8

class DishesController < ApplicationController
  before_filter :authenticate_user!, only: :rate

  # GET /dishes/1
  # GET /dishes/1.xml
  def show
    @dish = Dish.find(params[:id])

    @dish_history = @dish.dish_set.dishes.where("serve_date < ?", @dish.serve_date ).limit(3).order("serve_date DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dish }
    end
  end

  def rate
    @dish = Dish.find(params[:id])
    @date = @dish.serve_date
    rating = params[:rating].to_i
    @for_detail_view = params[:for_detail_view] || false

    begin
      @dish.rate! rating, current_user
      respond_to do |format|
        format.html { redirect_to (:back), notice: t(:rate_success) }
        format.js
      end
    rescue Exception => e

      respond_to do |format|
        format.html { redirect_to (:back), t(:rate_failure, date: l(@date)) }
        format.js {
          flash.now[:alert] = t(:rate_failure, date: l(@date))
          render template: 'dishes/rate_failure.js.erb'
        }
      end
    end
  end

end
