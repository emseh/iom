Rails.application.routes.draw do
  resources :memos
  resources :declares
  resources :memo_categories
  resources :declare_categories
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'dashboard#index'

  get "up" => "rails/health#show", as: :rails_health_check

  get 'dashboard/index'

  resources :patners
end
