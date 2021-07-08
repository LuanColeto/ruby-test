Rails.application.routes.draw do

  resources :categories
  resources :posts

  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  post "/forgot-password", to: "passwords#forgot_password"
  post "/reset-password", to: "forgot_passwords#reset_password"

  put "/profile/avatar", to: "profile#update_avatar"
end
