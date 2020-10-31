Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :home, only: :index
  resources :items, only: [:index, :new, :create, :update]
  resources :users, except: [:edit] do
    member do
      get 'edit'
      get 'logout'
      get 'credit_register'
      get 'edit_profiele'
    end
  end
  resources :credit_cards, only: [:index, :new, :show, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
