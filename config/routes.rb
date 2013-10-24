Gg::Application.routes.draw do

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :customers
  resources :suppliers
  resources :products
  resources :categories
  resources :vats
  resources :documents

  get '/landing_page', to: 'landing#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  ActiveAdmin.routes(self)
end
