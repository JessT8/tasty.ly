Rails.application.routes.draw do
  resources :foods
  resources :restaurants do
    collection do
      get :list
    end
  end
  devise_for :owners
  devise_for :users
  root 'onepage#index'
  get '/list' => 'restaurants#list', as: :list
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end