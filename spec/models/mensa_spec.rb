require 'spec_helper'

describe Mensa do
  before(:each) do
    @mensa = Factory(:mensa)
    @dish  = Factory(:dish)
  end

  it 'should return dish for specific date, not other dates' do

    other_dish = Factory(:dish, {serve_date:(@dish.serve_date - 1.days).to_date})
    @mensa.dishes << @dish
    @mensa.dishes << other_dish

    dishes_today = @mensa.dishes_for_date @dish.serve_date
    dishes_today.should include(@dish)
    dishes_today.should_not include(other_dish)
  end

  it 'should return dish for specific date, only this mensa' do

    @mensa.dishes << @dish

    other_mensa = Factory(:mensa)
    other_dish  = Factory(:dish, description: "Was anderes")
    other_mensa.dishes << other_dish

    dishes_today = @mensa.dishes_for_date @dish.serve_date
    dishes_today.should include(@dish)
    dishes_today.should_not include(other_dish)
  end

end
