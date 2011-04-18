require 'open-uri'
require 'iconv'

class FetchController < ApplicationController
  before_filter :authenticate_user!

  DISH_TAG_CONVERTS = {
    "Huhn.gif" => :chicken,
    "schwein.gif" => :pig,
    "Vegetarisch.gif" => :vegetarian,
    "Rind.gif" => :cow,
    "SunFlower.gif" => :vegan,
    "Bio.gif" => :bio,
    "Lamm.gif" => :lamb,
    "fisch.gif" => :fish
  }


  def index
    if !current_user.admin?
      flash[:alert] = t(:admin_only)
      redirect_to today_path
      return
    end

    @content = ""
    begin

      Mensa.all.each do |mensa|
        fetch mensa
      end

      @menue = {}
      @mensa.menue_categories.each do |category|
        @menue[category.name] = []
        (0..4).each do |day|
          @menue[category.name][day] = @mensa.dishes_for_date(@mon_date + day.days).where(menue_category_id: category.id)
        end
      end

      flash[:notice] = t(:fetch_complete)
      redirect_to '/today'

    rescue Exception => e
      p "************** An error occured. <br />" + e.message
      render text: "An error occured. <br />" + e.message
    end


  end

  private # ------------------------------------------------

  def fetch mensa
    @mensa = mensa

    f = open(mensa.url)
    f.rewind
    @site = Hpricot(Iconv.conv('utf-8', f.charset, f.readlines.join("\n")))

    mon_date_s = Sanitize.clean(@site.search("//table/tr[3]/td[2]").inner_html)

    @mon_date = Date.strptime(mon_date_s, "%d.%m.%Y")

    @dishes = {}

    mensa.menue_categories.each do |cat|
      @dishes[cat.name] = []
      cat.parse_datas.each do |pd|
        @dishes[cat.name] |= process_dish_row_mon_to_fri pd.row, cat, pd.col

      end
    end
  end

  def process_dish_row_mon_to_fri i, category, start_col=1
    dishes = []
    row = @site.search("//table/tr[#{i}]/td")
    price_row = @site.search("//table/tr[#{i+1}]/td")

    (start_col..5).each do |j|
      if row[j]


        begin
          price_a = process_price_td price_row[1+((j-1)*4)]
          price_b = process_price_td price_row[3+((j-1)*4)]

          dish = process_dish_td row[j]
          dish.serve_date = @mon_date + (j-start_col).days
          dish.price_a = price_a
          dish.price_b = price_b
          dish.menue_category = category

          tags = fetch_dish_tags_from_html row[j].inner_html
          tags.each { |tag| dish.tags << tag }

          @mensa.dishes << dish
          dish.assign_best_set!
          dishes << dish
        rescue Exception => e
          p "************** An error occured." + e.message
          p e.backtrace
          p
        end
      end
    end

    dishes
  end

  def process_price_td td
    cleaned = Sanitize.clean(td.inner_html)
    cleaned.gsub!(',','.')

    cleaned[/\d+.\d+/].to_f #workaround wegen komischen zeichen im string
  end

  def process_dish_td td
    dish = Dish.new

    without_bw = remove_blackwords(td.inner_html)
    dish.description = clean_html(without_bw)
    dish
  end

  def remove_blackwords description
    description = String.new(description)
    description['Tagessuppe'] and description['Tagessuppe'] = ""
    description['Dessert'] and description['Dessert'] = ""

    # TODO blacklist aus admin lesen

    description
  end

  def clean_html html
    html = String.new(html)
    html.gsub!(%r(<<<br>)," ")
    html.gsub!(%r(<br>>>)," ")
    html.gsub!(%r(<<),"")
    html.gsub!(%r(>>),"")
    html.gsub!(%r(&nbsp;)," ")
    html.gsub!(%r(&),"und")
    html.gsub!(/\*+/,"")

    html = Sanitize.clean(html)

    html.gsub!(/\s+/," ")

    html.strip
  end

  def fetch_dish_tags_from_html html
    tags = []

    DISH_TAG_CONVERTS.each do |k, v|
      if html[k]
        kind = v
        tags << DishTag.new(kind: kind)
      end
    end

    tags
  end
end
