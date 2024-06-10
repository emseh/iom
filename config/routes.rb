Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'dashboard#index'

  get "up" => "rails/health#show", as: :rails_health_check

  get 'dashboard', to: 'dashboard#index'

  resources :admins
  resources :declare_categories
  resources :declares
  resources :leaders
  resources :memos
  resources :memo_categories
  resources :patners
end
