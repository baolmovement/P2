Rails.application.routes.draw do   
  
  get 'likes/create'
  root 'posts#home' 
  resources :users 
  resources :sessions, only: [:new, :create] 
  resources :posts
  resources :likes

 
  resources :posts do 
    resources :likes
  end 

  delete '/logout' => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
