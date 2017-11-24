Rails.application.routes.draw do
  root 'homes#index'
  post "follow/:id", to: "homes#follow", as: "follow"
  post "retweet/:id", to: "homes#retweet", as: "retweet"
  get "suggestion/:slug", to: "homes#suggestion", as: "suggestion"
  get "user_detail/:id", to: "homes#user_detail", as: "user_detail"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
