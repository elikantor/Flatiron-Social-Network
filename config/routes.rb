Rails.application.routes.draw do
  
  resources :likes
  resources :comments
  resources :posts
  resources :users

  get '/', to: "application#home", as: "home"

  get '/login', to: "sessions#new"

  post '/login', to: "sessions#create"

  post '/logout', to: "sessions#destroy"

  get '/sign-up', to: "users#new"

  post '/posts/:id', to:"posts#profile_d", as: "postx"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
