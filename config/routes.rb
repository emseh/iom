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
  resources :declares do
    member do
      post :approve
      post :finish
    end
  end
  resources :memos do
    member do
      post :approve
      post :finish
    end
  end
  resources :leaders
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

  namespace :xendit, defaults: { format: :json } do
    resources :disbursements do
      collection do
        post :callback
      end
    end
  end
end
