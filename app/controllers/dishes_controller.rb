# coding: utf-8

class DishesController < ApplicationController
  before_filter :authenticate_user!, only: [:rate, :delete_rating]

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
    rating = params[:rating].to_i
    @for_detail_view = params[:for_detail_view] || false

    begin
      @dish.rate! rating, current_user
      respond_to do |format|
        format.html { redirect_to :back, notice: t(:rate_success) }
        format.js {
          flash.now[:notice] = t(:rate_success)
          render template: 'dishes/rate.js.erb'
        }
      end

    rescue Dish::NotServedYetError => e
      respond_to do |format|
        format.html { redirect_to :back, alert: t(:rate_failure_not_served) }
        format.js {
          flash.now[:alert] = t(:rate_failure_not_served)
          render template: 'dishes/rate_failure.js.erb'
        }
      end

    rescue Exception => e
      p e
      respond_to do |format|
        format.html { redirect_to :back, alert: t(:rate_failure, date: l(@dish.serve_date)) }
        format.js {
          flash.now[:alert] = t(:rate_failure, date: l(@dish.serve_date))
          render template: 'dishes/rate_failure.js.erb'
        }
      end
    end
  end

  def delete_rating
    @dish = Dish.find(params[:id])
    begin
      @dish.delete_rating current_user
      respond_to do |format|
        format.html { redirect_to :back, notice: t(:rating_destroyed) }
        format.js {
          flash.now[:notice] = t(:rating_destroyed)
          render template: 'dishes/rate.js.erb'
        }
      end
    rescue Exception => e
      respond_to do |format|
        format.html { redirect_to :back, alert: t(:general_failure) }
        format.js {
          flash.now[:alert] = t(:general_failure)
          render template: 'dishes/rate_failure.js.erb'
        }
      end
    end
  end

end
