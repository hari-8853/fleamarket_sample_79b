Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home, only: :index
  resources :items, only: :new
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
