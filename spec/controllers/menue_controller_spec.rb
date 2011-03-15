require 'spec_helper'

describe MenueController do
  include Devise::TestHelpers

  before (:each) do
    @user = Factory.create(:user)
    sign_in @user
  end
  
  render_views

  before(:each) do
    @mensa = Factory(:mensa)
    @dish = Factory(:dish)
    Factory(:defaults)
  end

  describe "GET day_menue" do
    it "should render the day menue" do
      get :day_menue, date: @dish.serve_date

      response.should render_template('menue/day_menue')
    end
  end
end