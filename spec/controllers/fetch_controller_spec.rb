require 'spec_helper'

describe FetchController do
  it "should should be successful" do
    @current_user = Factory(:user, is_admin: true)
    controller.stub!(:current_user).and_return(@current_user)

    mensa = Factory(:mensa)

    essen1 = MenueCategory.create(name: :essen_1)
    essen1.parse_datas << CategoryParseData.create(row: 4, col: 1)
    mensa.menue_categories << essen1

    get "index"
    assigns(:content).should_not be_nil
    response.should redirect_to('/today')
  end

  it "should fail if not admin" do
    @current_user = Factory(:user, is_admin: false)
    controller.stub!(:current_user).and_return(@current_user)

    mensa = Factory(:mensa)

    essen1 = MenueCategory.create(name: :essen_1)
    essen1.parse_datas << CategoryParseData.create(row: 4, col: 1)
    mensa.menue_categories << essen1


    get "index"
    assigns(:content).should be_nil
    response.should redirect_to('/today')
  end

end
