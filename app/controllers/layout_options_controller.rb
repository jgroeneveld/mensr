class LayoutOptionsController < ApplicationController
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

  end
end
