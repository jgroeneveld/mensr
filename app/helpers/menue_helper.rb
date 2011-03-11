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
end
