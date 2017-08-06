Rails.application.routes.draw do
  resources :orders
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources :contacts, only: [:new, :create]
  resources :orders
  resources :categories
  resources :products
end
