Rails.application.routes.draw do   
  
  root 'users#home' 
  resources :users 
  resources :sessions, only: [:new, :create] 
  resources :posts 
  delete '/logout' => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
