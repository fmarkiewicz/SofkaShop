Rails.application.routes.draw do
  resources :orders
  resources :categories
  resources :products
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  Rails.application.routes.draw do
    resources :orders
    resources :categories
    resources :products
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      # passwords: 'devise_user/passwords',
      registrations: 'users/registrations'
    }
  end

end
