Rails.application.routes.draw do
  resources :foods
  resources :restaurants
  devise_for :owners
  devise_for :users
  root 'onepage#index'
  get '/restaurants' => 'restaurant#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end