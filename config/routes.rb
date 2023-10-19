Rails.application.routes.draw do
  get 'payments/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome_pages#index'

  devise_for :users

  resources :categories, only: [:index, :new, :create] do
    resources :payments, only: [:index]
  end

  resources :payments, only: [:new, :create]

end
