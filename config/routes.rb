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
  # get 'order_history/index'
  # get 'order_history/show'

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
  resources :order, only: [:new, :create]
  resources :order_history, only: [:index, :show], as: 'order_history'

  get ':permalink', to: 'pages#permalink', as: 'permalink'
  # get 'order/order_summary', as: 'summary'
  # get 'order/create_order', as: 'checkout'

  root to: 'classified#index'
end
