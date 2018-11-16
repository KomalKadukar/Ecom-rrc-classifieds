Rails.application.routes.draw do
   devise_for :students

  # get 'student/index'
  # get 'student/show'
  # get 'program/index'
  # get 'program/show'
  # get 'category/index'
  # get 'category/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :classified, only: [:index, :show] do
    collection do
      get 'results'
    end
  end

  resources :category, only: [:index, :show], as: 'categories'
  resources :program, only: [:index, :show], as: 'programs'
  resources :student, only: [:index, :show], as: 'students'
  resources :pages, only: [:show]

  get ':permalink', to: 'pages#permalink', as: 'permalink'

  root to: 'classified#index'
end
