Gg::Application.routes.draw do

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :customers
  resources :suppliers
  resources :products
  resources :categories
  resources :vats
  resources :items
  resources :invoices
  resources :banks
  resources :checks
  resources :locations
  resources :receipts

  resources :documents do
    collection do
      get 'options'
    end
  end

  get '/landing_page', to: 'landing#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  ActiveAdmin.routes(self)
end
