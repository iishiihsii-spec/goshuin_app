Rails.application.routes.draw do
  resources :user_stamps, only: [:index]
  resources :maps, only: [:index]
  devise_for :users
  root to: "homes#index"
  resources :goshuins
end
