Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  resources :users, only: [:index, :edit, :update]
  resources :items, only: [:index, :show]
  resources :item_payment

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
