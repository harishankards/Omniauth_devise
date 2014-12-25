Rails.application.routes.draw do
  resources :authentications

  root to: 'visitors#index'
  devise_for :users,:controllers => {:registrations => "registrations" } 
  resources :users
  get '/auth/:provider/callback' => 'authentications#create'
    delete '/authentications"' => 'authentications#destroy'
end
