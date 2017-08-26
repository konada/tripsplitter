Rails.application.routes.draw do
  devise_for :users
  resources :trips, only: [:new, :index, :create]
  root 'trips#new'
end
