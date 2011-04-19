class LayoutOptionsController < ApplicationController
  include LayoutOptionsHelper

  before_filter :authenticate_user!

  # PUT /layout_options/1
  # PUT /layout_options/1.xml
  def update
    @layout_option = current_user.layout_option

    respond_to do |format|
      if @layout_option.update_attributes(params[:layout_option])
        flash[:notice] = 'Einstellungen wurden gespeichert.'
        format.html { redirect_to(action: "customize") }
        format.xml  { head :ok }
      else
        format.html { render "edit" }
        format.xml  { render :xml => @layout_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  def customize
    @layout_option = current_user.layout_option || LayoutOption.create(user_id: current_user.id)

    render 'edit'
  end

  def sort_categories
    @layout_option = current_user.layout_option || LayoutOption.create(user_id: current_user.id)

    data = params[:data].gsub("sortdishes[]=","").gsub('&',",")

    @layout_option.category_sort_order = data
    @layout_option.save
    render text: ''
  end

  def add_category
    layout_option = current_user.layout_option || LayoutOption.create(user_id: current_user.id)
    @category_id = params[:id]
    @date = params[:date].to_date

    cats = layout_option.category_sort_order_array
    cats.unshift(@category_id.to_i)
    layout_option.category_sort_order_array = cats
    layout_option.save!

    @dish = MenueCategory.find(@category_id).dishes.where(serve_date: @date).first
    @not_visible_categories = find_not_visible_categories
  end

  def remove_category
    @layout_option = current_user.layout_option || LayoutOption.create(user_id: current_user.id)
    @category_id = params[:id]
    @date = params[:date].to_date

    cats = @layout_option.category_sort_order_array
    cats.delete(@category_id.to_i)
    @layout_option.category_sort_order_array = cats
    @layout_option.save!

    @not_visible_categories = find_not_visible_categories
  end
end
