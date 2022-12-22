Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "admin/users#index"

  get "/login", to: "admin/sessions#new", as: :login
  get "/logout", to: "admin/sessions#destroy", as: :logout
  get "/sign_up", to: "admin/users#new", as: :sign_up

  namespace :admin do
    resources :comments, only: [:index]
    resources :tags , only: [:index , :edit, :update, :destroy]
    resources :posts , only: [:index, :edit, :update, :show, :new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :users, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end

end
