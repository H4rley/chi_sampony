# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    collection do
      get :manage
      get :filter
    end
  end

  resources :reviews
  resource :shopping_card
  resources :orders
end
