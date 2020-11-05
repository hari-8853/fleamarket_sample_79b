Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :home, only: :index
  resources :buyers, only: :index
  get 'done', to: 'buyers#done' 
  resources :items, only: [:index, :new, :show, :create, :update]
  resources :comments, only: [:create, :update, :destroy]
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
