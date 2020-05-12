Rails.application.routes.draw do
  root 'items#index'


  resources :items, only: [:index, :show] do
    resources :comment, only: :create
  end

  resources :items, only: [:index, :show, :new]
  resources :item_payment

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
