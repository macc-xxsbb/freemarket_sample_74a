Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :items, only: [:index, :show, :new, :create] do
    resources :comment, only: :create
    resources :item_image, only: :new
    resources :brand, only: :new
    resources :shipping, only: :new
  end
  resources :item_payment
end
