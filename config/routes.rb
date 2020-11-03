Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :home, only: :index
  resources :items, only: [:index, :new, :edit, :destroy, :create, :update] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end
  end  
  resources :users, except: [:edit] do
    member do
      get 'edit'
      get 'logout'
      get 'credit_register'
      get 'edit_profiele'
    end
  end
  resources :credit_cards, only: [:index, :new, :show, :create, :destroy]

end
