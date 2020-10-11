Rails.application.routes.draw do
  # by Kikuchi
  get 'home/index'
  root 'home#index'
  # by Nakazima
  root 'items#index'
  resources :items, only: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
