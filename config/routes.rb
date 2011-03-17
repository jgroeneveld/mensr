MensaBewerter::Application.routes.draw do

  match 'page/about', as: 'about'

  match 'dishes/rate', as: 'rate_dish'
  match 'dishes/delete_rating', as: 'delete_rating'
  match 'facebox/dish_photo' => 'facebox#dish_photo', as: 'facebox_dish_photo'
  match 'facebox/ratings_for_dish_set' => 'facebox#ratings_for_dish_set', as: 'facebox_ratings_for_dish_set'
  match 'facebox/ratings_for_dish' => 'facebox#ratings_for_dish', as: 'facebox_ratings_for_dish'

  match 'layout_options/customize', as: 'customize_menue'
  match 'layout_options/sort_categories', as: 'sort_categories'

  resources :layout_options
  resources :ratings
  resources :menue_categories
  resources :mensas
  resources :dish_tags
  resources :dishes
  resources :dish_photos

  match 'week(/:mensa_id(/:mon_date))' => 'menue#week_menue', as: "week"
  match 'day_menue/:date' => 'menue#day_menue' , as: 'day_menue'
  match 'today' => "menue#day_menue", as: "today"

  match 'fetch' => 'fetch#index'

  devise_for :users, :path_names => { :sign_up => "register" }

  root :to => "menue#day_menue"

end