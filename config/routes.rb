MensaBewerter::Application.routes.draw do

  match 'dishes/rate', as: 'rate_dish'
  match 'facebox/dish_photo' => 'facebox#dish_photo', as: 'facebox_dish_photo'

  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'layout_options/customize', as: 'customize_menue'
  match 'layout_options/sort_categories', as: 'sort_categories'

  resources :layout_options
  resources :sessions
  resources :users
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

  root :to => "menue#week_menue"

end