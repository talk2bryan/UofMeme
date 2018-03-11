Rails.application.routes.draw do
  
  get 'sessions/new'
  resources :posts do
  	post :like 
  	post :dislike 
  end

  resources :users 
    

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end