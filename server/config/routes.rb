Rails.application.routes.draw do
  
  resources :users
 
  resources :posts do
    post :show
  end

  resources :account_activations, only: [:edit]

  resources :likes, only: [:create, :show] do 
    post :create
  end

  resources :dislikes, only: [:create, :show] do 
    post :create
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end