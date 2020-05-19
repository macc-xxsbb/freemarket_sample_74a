Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :items, only: [:index, :show, :new] do
    resources :comment, only: :create
  end
  resources :item_payment
  resources :credit_cards, only: [:new, :create, :edit] do
  end
end
