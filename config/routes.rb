Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :classified, only: [:index, :show]
  resources :pages, only: [:show]

  root to: 'classified#index'
end
