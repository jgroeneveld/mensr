module LayoutOptionsHelper

  def show_tags?
    if current_user
      if current_user.layout_option
        return current_user.layout_option.show_tags?
      end
    end

    true
  end

  def show_price_a?
    if current_user
      if current_user.layout_option
        return current_user.layout_option.show_price_a?
      end
    end

    true
  end

  def show_price_b?
    if current_user
      if current_user.layout_option
        return current_user.layout_option.show_price_b?
      end
    end

    true
  end

  def show_rating?
    if current_user
      if current_user.layout_option
        return current_user.layout_option.show_rating?
      end
    end

    true
  end

  def category_sort_order_array
    order = Defaults.first.category_sort_order

    if current_user && current_user.layout_option && current_user.layout_option.category_sort_order
      order = current_user.layout_option.category_sort_order
    end

    order.split(",").collect{ |e| e.to_i }
  end

  def find_visible_categories
    category_sort_order_array.collect { |cid|
      MenueCategory.find cid
    }
  end

  def find_not_visible_categories
    not_visible_categories = Defaults.find(1).category_sort_order.split(",").map { |id| MenueCategory.find id.to_i }
    not_visible_categories -= find_visible_categories

    not_visible_categories
  end
end
