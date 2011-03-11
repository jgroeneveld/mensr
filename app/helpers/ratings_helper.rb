module RatingsHelper

  def print_star_for_dish identifier, i, options={}
    options[:for_detail_view] ||= false

    if options[:filled]
      val = image_tag "rating_empty.png", id: "star_empty_#{identifier}_#{i}", style: "display:none", title: "Tageswertung"
      val << "\n"
      val << image_tag("rating_filled.png", id: "star_filled_#{identifier}_#{i}", title: "Tageswertung")
    else
      val = image_tag "rating_filled.png", id: "star_filled_#{identifier}_#{i}", style: "display:none", title: "Tageswertung"
      val << "\n"
      val << image_tag("rating_empty.png", id: "star_empty_#{identifier}_#{i}", title: "Tageswertung")
    end

    if current_user
      link_to(val, rate_dish_path(id: identifier, rating: i+1, for_detail_view: options[:for_detail_view]), remote: true)
    else
      link_to(val, login_path)
    end
  end


  def print_star_for_set identifier, i, options={}
    if options[:filled]
      image_tag "rating_for_set_filled.png", title: "Gesamtwertung"
    else
      image_tag "rating_for_set_empty.png", title: "Gesamtwertung"
    end
  end
end
