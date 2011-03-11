module DishTagsHelper
  ALLOWED_KINDS = [:bio, :chicken, :cow, :fish, :lamb, :pig, :vegan, :vegetarian]

  def image_for_tag tag
    image_tag image_url_for_tag(tag), alt: t(tag.kind), title: t(tag.kind)
  end

  def image_url_for_tag tag
    case tag.kind
    when :bio
      "dish_tags/bio.png"

    when :chicken
      "dish_tags/chicken.png"

    when :cow
      "dish_tags/cow.png"

    when :fish
      "dish_tags/fish.png"

    when :lamb
      "dish_tags/lamb.png"

    when :pig
      "dish_tags/pig.png"

    when :vegan
      "dish_tags/vegan.png"

    when :vegetarian
      "dish_tags/vegetarian.png"
    end
  end

end