Rails.application.routes.draw do
  get 'payments/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  # Defines the root path route ("/")
  root 'welcome_pages#index'

  resources :categories, only: [:index, :new, :create] do
    resources :payments, only: [:index]
  end

end
