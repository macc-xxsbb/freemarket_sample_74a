Rails.application.routes.draw do
  root 'items#index'
  resources :item_payment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
