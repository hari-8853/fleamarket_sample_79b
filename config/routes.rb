Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :home, only: :index
  # resources :items, only: [:index, :new, :show, :create, :update] do
  #   resources :buyers, only: [:index] do
  #     collection do
  #       get 'done', to: 'buyers#done'
  #       post 'pay', to: 'buyers#pay'
  #     end
  #   end
  # end
  # resources :buyers, only: :index
  get 'done', to: 'buyers#done'
  resources :items, only: [:index, :new, :show, :create, :update] do
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
    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
    end
  end  
  resources :users, except: [:edit] do
    member do
      get 'edit'
      get 'logout'
      get 'edit_profiele'
    end
  end
  resources :credit_cards, only: [:new, :show,] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
