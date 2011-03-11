module MenueHelper
  BG_COLORS = %w(#eff6fe #ecffee #feffe5 #fddfde #f3e0ff)
  COLORS = %w(#5b99ff #67db56 #d1da41 #cc514e #9a4ede)

  def current_mon_date
    Time.now.to_date.beginning_of_week
  end

  def bg_color_for_mensa_id id
    BG_COLORS[id-1]
  end

  def color_for_mensa_id id
    COLORS[id-1]
  end

  def print_week_menue_previous_week_control mensa, mon_date
    next_start = (mon_date - 7.days)
    if mensa.dishes_in_week(next_start).count > 0
      link_to image_tag("week_backward.png"), week_path(mensa_id: mensa.id, mon_date: next_start)
    else
      image_tag('week_backward_disabled.png')
    end
  end

  def print_week_menue_next_week_control mensa, mon_date
    next_start = (mon_date + 7.days)
    if mensa.dishes_in_week(next_start).count > 0
      link_to image_tag("week_forward.png"), week_path(mensa_id: mensa.id, mon_date: next_start)
    else
      image_tag('week_forward_disabled.png')
    end
  end
end
