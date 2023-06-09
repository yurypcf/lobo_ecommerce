Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'

  namespace :admin do
    root to: 'home#index'
    resources :users
    resources :products do
      get '/page/:page', action: :index, on: :collection
      get '/activation', action: :activate_deactivate
    end
  end

  namespace :users do
    resources :products
  end
end
