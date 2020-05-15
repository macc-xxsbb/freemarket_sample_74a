Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'

  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :items, only: [:index, :show, :new] do
    resources :comment, only: :create
  end
  resources :item_payment

end
