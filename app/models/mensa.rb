# == Schema Information
# Schema version: 20110222180355
#
# Table name: mensas
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  hours      :string(255)
#  location   :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Mensa < ActiveRecord::Base
  has_many :dishes
  has_many :dish_sets
  has_many :menue_categories

  def dishes_for_date the_date
    dishes.where(serve_date: the_date)
  end

  def dishes_between_dates date1, date2
    dishes.where('serve_date >= ? AND serve_date <= ?', date1, date2)
  end

  def dishes_in_week mon_date
    dishes_between_dates(mon_date, mon_date+4.days)
  end
end
