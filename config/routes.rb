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
  resources :items do
    resources :comments, only: :create
    resources :item_images, only: [:new, :edit, :update]
    resources :brands, only: [:new, :edit, :update]
    resources :shipping, only: [:new, :edit, :update]
  end
  resources :credit_cards, only: [:new, :edit, :create, :show, :destroy] do
  end
  resource :item_payments do
    member do
      get  "buy"
      post "pay"
    end
  end
end
