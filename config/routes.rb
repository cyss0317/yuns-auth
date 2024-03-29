# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :sessions, only: %i[create]
    resources :users, only: %i[create update destroy]
    resources :organizations, only: %i[create update destroy]
    get :logged_in, to: 'sessions#logged_in'
  end

  delete :logout, to: 'sessions#logout'
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'static#home'
end
