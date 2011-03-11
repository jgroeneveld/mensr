require 'spec_helper'

describe DishSet do
  before(:each) do
    @dish = Factory(:dish)
  end

  it "should calculate the right percentage" do
    @dish.dish_set.match_percentage(@dish).should == 1
  end

  it "should match itself" do
    @dish.dish_set.matches?(@dish).should be_true
  end

  it "should find best match" do
    match = DishSet.find_matching_set_for @dish
    match.should == @dish.dish_set
  end

  describe "average_rating" do

    it "should update its average rating if a child dish is rated - trivial" do
      set = @dish.dish_set
      set.average_rating.should == @dish.average_rating

      @dish.rate! 3, Factory(:user)
      set.average_rating.should == @dish.average_rating
    end

    it "should update its average rating if a child dish is rated - complex" do

      user1 = Factory(:user)
      user2 = Factory(:user, email: "andere@email.com")
      user3 = Factory(:user, email: "harald@bla.com")
      @dish.dish_set.average_rating.should == @dish.average_rating

      @dish.rate! 5, user1
      @dish.rate! 5, user2
      @dish.rate! 5, user3
      @dish.dish_set.average_rating.should == @dish.average_rating


      other_dish = Factory(:dish, serve_date: Time.now.to_date - 7.days)
      other_dish.assign_best_set!
      other_dish.dish_set.should == @dish.dish_set
      other_dish.rate! 1, user1

      other_dish.dish_set.average_rating.should == 4
      other_dish.dish_set.average_rating.should_not == 3
    end

  end
end