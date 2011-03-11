# coding: utf-8

module DishesHelper
  ALLOWED_CATEGORIES = [:essen_1, :essen_2, :wok_und_pfanne, :vegetarisch, :auflaeufe_und_gratin, :pizza, :pasta, :suppe, :front_cooking, :bio_menue]
  NOT_REAL_DISH_REGEX = /geschlossen|entfällt|personalversammlung|streik/i

  def format_dish_description description
    description = h description
    description[0] = description[0].capitalize

    if current_user && current_user.layout_option

      current_user.layout_option.like_words_array.each do |w|
        description.match(/#{w}/i) { |m| m.to_a.each { |e| description[e] = "<span class='like_word'>#{e}</span>" } }
      end

      current_user.layout_option.dislike_words_array.each do |w|
        description.match(/#{w}/i) { |m| m.to_a.each { |e| description[e] = "<span class='dislike_word'>#{e}</span>" } }
      end
    end

    description
  end

  def link_to_dish_photo photo, first
    if first
      link_to image_tag(photo.picture.url(:middle)), facebox_dish_photo_path(id: photo.id), rel: 'facebox'
    else
      link_to image_tag(photo.picture.url(:thumb)), facebox_dish_photo_path(id: photo.id), rel: 'facebox', class: "mouse_over_image"
    end

  end

end
