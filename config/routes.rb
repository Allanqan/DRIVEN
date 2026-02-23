Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :drivers do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]
  get "users/:id/drivers", to: "users#drivers", as: :user_bookings
end