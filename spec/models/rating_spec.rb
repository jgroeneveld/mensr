require 'spec_helper'

describe Rating do

before(:each) do

end

it "should not be possible to rate more than two dishes a day" do
  user  = Factory(:user)
  dish  = Factory(:dish)
  dish1 = Factory(:dish, description: "Eine andere")
  dish2 = Factory(:dish, description: "Noch viel anders")

  rating = Rating.new
  rating.user = user
  rating.value = 1
  rating.dish = dish
  rating.save.should be_true

  rating = Rating.new
  rating.user = user
  rating.value = 1
  rating.dish = dish1
  rating.save.should be_true

  rating = Rating.new
  rating.user = user
  rating.value = 1
  rating.dish = dish2
  rating.save.should be_false

end

end
