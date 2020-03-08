Rails.application.routes.draw do
  resources :foods do
    collection do
      get :favFoodList
    end
  end
  resources :restaurants do
    collection do
      get :list, :individualFavRestaurant, :ownerRestaurant
      delete :deleteRestaurant
    end
  end
  devise_for :owners
  devise_for :users
  root 'onepage#index'
  get 'favlist/restaurants/' => 'restaurants#list', as: :favRestaurantList
  get 'favlist/restaurants/:id' => 'restaurants#individualFavRestaurant', as: :individualFavRestaurant
  delete 'favlist/restaurants/:id' => 'restaurants#deleteRestaurant'
  get 'favlist/foods/' => 'foods#list', as: :favFoodList
  get 'owner/restaurants' => 'restaurants#ownerRestaurant', as: :ownerRestaurant
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end