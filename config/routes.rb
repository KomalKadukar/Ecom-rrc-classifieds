Rails.application.routes.draw do
  get 'category/index'
  get 'category/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :classified, only: [:index, :show]
  resources :category, only: [:index, :show], as: 'categories'
  resources :pages, only: [:show]

  get ':permalink', to: 'pages#permalink', as: 'permalink'

  root to: 'classified#index'
end
