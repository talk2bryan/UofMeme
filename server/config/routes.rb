Rails.application.routes.draw do
  
  resources :posts do
  	post :like 
  	post :dislike 
  end

  resources :users do
    post :login
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end