Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home, only: :index
  resources :items, only: :new
  resources :users, except: [:edit] do
    member do
      get 'edit'
      get 'logout'
      get 'credit_register'
      get 'edit_profiele'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
