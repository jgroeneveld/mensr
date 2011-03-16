require 'spec_helper'

describe Dish do

  before(:each) do
    @mensa = Factory(:mensa)
    @dish  = Factory(:dish)
    @user  = Factory(:user)
    @mensa.dishes << @dish
  end

  it "should update average rating" do
    @dish.average_rating.should == 0

    @dish.rate! 5, @user
    @dish.average_rating.should == 5

    @dish.rate! 1, Factory(:user, {email: "asdf@user.de", name: "AnotherUser"})
    @dish.average_rating.should == 3
  end

  it "should not exceed the rating limits" do
    lambda {@dish.rate!(6, @user)}.should raise_error
    lambda {@dish.rate!(10, @user)}.should raise_error
  end

  it "should not deceed the rating limits" do
    lambda {@dish.rate!(0, @user)}.should raise_error
    lambda {@dish.rate!(-10, @user)}.should raise_error
  end

  it "should update the rating of an user of one dish" do
    @dish.rate! 5, @user
    @dish.average_rating.should == 5

    @dish.rate! 1, @user
    @dish.average_rating.should == 1
  end

  it 'should not update the rating if not yet served' do
    @dish.serve_date = Time.now + 1.day
    lambda {@dish.rate!(5, @user)}.should raise_error
  end

  it "should give the keywords" do
    @dish.description = "Huhn mit Reis und Karotten"
    @dish.key_words.should include("Huhn")
    @dish.key_words.should include("Reis")
    @dish.key_words.should include("Karotten")
    @dish.key_words.should_not include("mit")
    @dish.key_words.should_not include("und")
  end

  it "should not be possible to create the same dish twice" do
    dish = Factory.build(:dish, description: "Die Beschreibung", serve_date: Time.now.to_date)
    dish.save
    dish.should be_valid

    other_dish = Factory.build(:dish, description: "Die Beschreibung", serve_date: Time.now.to_date)
    other_dish.save
    other_dish.should_not be_valid
  end

  describe "Set" do

    it "should add new set when saved" do
      @dish.dish_set.should_not be_nil
    end

    it "should set the keywords of the set" do
      @dish.key_words.each do |e|
        @dish.dish_set.common_key_words_array.should include(e)
      end
    end

    it "should find the best matching set and assign it" do
      description = "Huhn mit Kakao, Bohnen und Geldstaub"
      dish = Factory.build(:dish, description: description)
      dish.save!

      other_dish = Factory.build(:dish, serve_date: dish.serve_date - 1.day, description: description)
      other_dish.assign_best_set!
      other_dish.dish_set.should == dish.dish_set
    end

  end

end