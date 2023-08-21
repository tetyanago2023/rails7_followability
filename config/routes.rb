Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users, only: %i[index show]
  #Post to user/:id/block
  post "users/:id/block", to: "users#block", as: "block_user"

  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
