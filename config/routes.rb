Rails.application.routes.draw do
  resources :trips, only: [:new, :create]
  root 'trips#new'
end
