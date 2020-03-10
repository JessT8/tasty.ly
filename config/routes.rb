Rails.application.routes.draw do
  resources :foods do
    collection do
      get :favFoodList
      post :favFood
      delete :deleteFood
    end
  end
  resources :foods, only: [:new],
    :path => "owner/food/:restaurant_id", as: :newItem

  resources :restaurants do
    collection do
      get :list, :individualFavRestaurant, :ownerRestaurant
      delete :deleteRestaurant
      post :favRestaurant
    end
  end
  devise_for :owners
  devise_for :users

  root :to => 'restaurants#list'
  #users
  get 'favlist/restaurants/' => 'restaurants#list', as: :favRestaurantList
  get 'favlist/restaurants/:id' => 'restaurants#individualFavRestaurant', as: :individualFavRestaurant
  get 'favlist/foods/' => 'foods#list', as: :favFoodList
  post 'favlist/foods/:id' => 'foods#favFood'
  delete 'favlist/foods/:id' => 'foods#deleteFood'

  post 'favlist/restaurants/:id' => 'restaurants#favRestaurant'
  delete 'favlist/restaurants/:id' => 'restaurants#deleteRestaurant'


  #owners
  get 'owner/restaurants' => 'restaurants#ownerRestaurant', as: :ownerRestaurant

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end