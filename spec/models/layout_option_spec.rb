# coding: utf-8
require 'spec_helper'

describe LayoutOption do

  before(:each) do
    @options = Factory(:layout_option)
  end

  describe "Like words" do

    it "should return seperated words from comma seperated string" do
      @options.like_words = "pilze, bohnen,  hühnerfrikassee,sahne,penne "

      @options.like_words_array.should include("pilze")
      @options.like_words_array.should include("bohnen")
      @options.like_words_array.should include("hühnerfrikassee")
      @options.like_words_array.should include("sahne")
      @options.like_words_array.should include("penne")

    end
  end

  describe "Dislike words" do
    it "should return seperated words from comma seperated string" do
      @options.dislike_words = "pilze, bohnen,  hühnerfrikassee,sahne,penne "

      @options.dislike_words_array.should include("pilze")
      @options.dislike_words_array.should include("bohnen")
      @options.dislike_words_array.should include("hühnerfrikassee")
      @options.dislike_words_array.should include("sahne")
      @options.dislike_words_array.should include("penne")

    end
  end
end
