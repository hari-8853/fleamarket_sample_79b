Rails.application.routes.draw do

end

root 'items#index'
resources :items, only: [:new, :create,] do

end

