Rails.application.routes.draw do
  get 'post/home'
  get 'post/new_post'
  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
