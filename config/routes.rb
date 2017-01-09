Rails.application.routes.draw do
  resource :trip, only: [:new, :create]
  root 'trips#new'
end
