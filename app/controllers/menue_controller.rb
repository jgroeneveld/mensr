class MenueController < ApplicationController
  include MenueHelper
  include LayoutOptionsHelper

  def day_menue
    @customize = current_user && params[:customize]

    @date =  (params[:date] || (Time.now.hour > 14 ? Time.now + 1.day : Time.now)).to_date
    @dishes = []

    category_sort_order_array.each do |cat_id|
      cat = MenueCategory.find cat_id
      @dishes << cat.dishes.where(serve_date: @date).first
    end

    @dishes.compact!


  end

  def week_menue
    @tertiary_navi_links ||= []
    @mensa = Mensa.find (params[:mensa_id] || 1)
    @mon_date =  (params[:mon_date] || current_mon_date).to_date

    Mensa.all.each do |mensa|
      @tertiary_navi_links << {
        name: mensa.name,
        url: url_for(action: "week_menue", mensa_id: mensa.id, mon_date: current_mon_date),
        active: (@mensa != mensa),
        bullet_color: color_for_mensa_id(mensa.id)
      }
    end

    @menue = {}
    @mensa.menue_categories.each do |category|
      @menue[category.name] = []
      (0..4).each do |day|
        @menue[category.name][day] = @mensa.dishes_for_date(@mon_date + day.days).where(menue_category_id: category.id)
      end
    end
  end

end
