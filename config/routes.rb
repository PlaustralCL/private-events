Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'

  devise_for :users
  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  resources :users, only: %i[index show]
  root "events#index"

  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
