Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :trips, only: [:new, :index, :create]
  root 'trips#new'
end
