Rails.application.routes.draw do

  #api
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :users, only: [:index, :create, :show ]
      resources :posts, only: [:create, :show, :update] do
        resources :comments
      end
      resources :likes, only: [:create] do 
        post :create
      end
      resources :dislikes, only: [:create] do 
        post :create
      end

      get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
    end
  end
  
  resources :users
 
  resources :posts do
    resources :comments
    post :show
    get  :show
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