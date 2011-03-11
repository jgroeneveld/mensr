Factory.define :layout_option do |lo|
  lo.add_attribute :show_tags, true
  lo.add_attribute :show_price_a, true
  lo.add_attribute :show_price_b, true
  lo.add_attribute :show_rating, true
  lo.add_attribute :like_words, ""
  lo.add_attribute :dislike_words, ""
end

