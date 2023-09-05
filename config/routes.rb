Rails.application.routes.draw do
  get 'hello_world/index'
  # Nested routes for users and their posts, comments, and likes
  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Routes for standalone posts (not nested under users)
  # resources :posts, only: [:new, :create]

  # Root route to display a list of users
  root "users#index"
end
