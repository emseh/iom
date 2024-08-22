Rails.application.routes.draw do
  resources :bank_accounts
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
  resources :payout_channels, except: %i[create destroy]
  resources :profiles do
    collection do
      get :new_bank_account
      post :create_bank_account
    end
    member do
      get :show_bank_account
      get :edit_bank_account
      patch :update_bank_account
      delete :destroy_bank_account
    end
  end
end
