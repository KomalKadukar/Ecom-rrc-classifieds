Rails.application.routes.draw do
  devise_for :students

  # get 'student/index'
  # get 'student/show'
  # get 'program/index'
  # get 'program/show'
  # get 'category/index'
  # get 'category/show'
  # get 'cart/show'
  # get 'order_classified/create'
  # get 'order_classified/update'
  # get 'order_classified/destroy'
  # get 'carts/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :classified, only: [:index, :show] do
    member do
      post :add_to_cart, as: 'add_to_cart'
      post :remove_from_cart, as: 'remove_from_cart'
    end
    collection do
      get 'results'
      post 'newly_added', as: 'new'
      post 'recently_updated', as: 'updated'
      post 'clear_the_cart', as: 'clear_cart'
    end
  end

  resources :category, only: [:index, :show], as: 'categories'
  resources :program, only: [:index, :show], as: 'programs'
  resources :student, only: [:index, :show], as: 'students'
  resources :pages, only: [:show]
  resources :cart, only: [:show]
  resources :order_classified, only: [:create, :update, :destroy]

  get ':permalink', to: 'pages#permalink', as: 'permalink'

  root to: 'classified#index'
end
