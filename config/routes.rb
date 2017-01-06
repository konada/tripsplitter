Rails.application.routes.draw do
  resources :trips, only: [:new, :create, :show]
  root 'trips#new'
end
