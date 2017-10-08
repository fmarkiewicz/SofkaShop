Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :orders
  resources :categories
  resources :products
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources :contacts, only: [:new, :create]
  resources :orders
  resources :categories
  resources :products
  get '/products_list', to: 'products#products_list', as: 'products_list'
end
