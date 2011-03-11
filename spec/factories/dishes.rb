# coding: utf-8

Factory.define :dish do |dish|
  dish.add_attribute :price_a, 2.2
  dish.add_attribute :price_b, 4.2
  dish.add_attribute :description, "Kotelett vom Schwein in Wiener Panade mit Waldpilzsauce, saisonalem Gemüse und Salzkartoffeln"
  dish.add_attribute :serve_date, Time.now.to_date
end