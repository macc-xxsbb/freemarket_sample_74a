Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  
  resources :users, only: [:index, :show, :edit, :update, :new]
  resources :items, only: [:index, :show]
  resources :item_payment

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
