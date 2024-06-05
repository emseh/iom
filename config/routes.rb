Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'dashboard#index'

  get "up" => "rails/health#show", as: :rails_health_check

  get 'dashboard/index'
end
