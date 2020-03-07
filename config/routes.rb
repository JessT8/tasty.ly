Rails.application.routes.draw do
  resources :foods
  resources :restaurants do
    collection do
      get :list, :individualFavRestaurant
    end
  end
  devise_for :owners
  devise_for :users
  root 'onepage#index'
  get '/restaurant/favlist' => 'restaurants#list', as: :favRestaurantList
  get '/restaurants/favlist/:id' => 'restaurants#individualFavRestaurant', as: :individualFavRestaurant
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end