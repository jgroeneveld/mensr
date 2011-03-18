# coding: utf-8
module ActionsHelper
  ALLOWED_KINDS = [:new, :edit]

  def description_for action
    s = "#{action.user.name} hat "

    if action.affected_type == "Rating"
      s << "ein #{link_to 'Gericht', action.dish} bewertet."
    elsif action.affected_type == "DishPhoto"
      s << "ein Foto für ein #{link_to 'Gericht', action.dish} hochgeladen."
    end

    raw s
  end

  def additional_for action
    if action.affected_type == "Rating"
      render partial: 'ratings/simple_stars', locals: {rating: action.affected.value}
    else
      ""
    end

  end
end