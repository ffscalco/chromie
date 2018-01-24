Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: [:index]
  devise_for :users
end
