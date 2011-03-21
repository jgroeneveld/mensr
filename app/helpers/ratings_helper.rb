module RatingsHelper

  def print_simple_star filled
    if filled
      image_tag("rating_filled.png")
    else
      image_tag("rating_empty.png")
    end
  end

  def print_star_for_dish identifier, i, options={}
    options[:for_detail_view] ||= false

    if options[:filled]
      val = image_tag "rating_empty.png", id: "star_empty_#{identifier}_#{i}", style: "display:none", title: t(:dish_rating)
      val << "\n"
      val << image_tag("rating_filled.png", id: "star_filled_#{identifier}_#{i}", title: t(:dish_rating))
    else
      val = image_tag "rating_filled.png", id: "star_filled_#{identifier}_#{i}", style: "display:none", title: t(:dish_rating)
      val << "\n"
      val << image_tag("rating_empty.png", id: "star_empty_#{identifier}_#{i}", title: t(:dish_rating))
    end

    link_to(val, rate_dish_path(id: identifier, rating: i+1, for_detail_view: options[:for_detail_view]), remote: user_signed_in?)
  end


  def print_star_for_set identifier, i, options={}
    if options[:filled]
      image_tag "rating_for_set_filled.png", title: t(:dish_set_rating)
    else
      image_tag "rating_for_set_empty.png", title: t(:dish_set_rating)
    end
  end

  def distributions_for_ratings ratings
    dist = [0, 0, 0, 0, 0]
    ratings.each {|r| dist[r.value-1] += 1 }

    stars = 0
    distributions = dist.collect do |d|
      stars += 1
      {stars: stars, count: d, percentage: (d.to_f/ratings.count.to_f)*100}
    end

    distributions.reverse
  end

  def chart_for_ratings ratings
    stars = [0, 0, 0, 0, 0]
    stars.each_index do |i|
      ratings.each {|r| stars[i] += 1 if r.value == (i+1) }
    end


    GoogleChart::PieChart.new('350x200', "Bewertungen") do |c|
      stars.each_index do |i|
        c.data "#{i+1} Sterne (#{stars[i]})", stars[i] if stars[i] > 0
      end

      c.fill :background, :solid, color: "eff6fe"
      return c.to_url
    end
  end
end
