Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    collection do
      get :manage
    end
  end

end
