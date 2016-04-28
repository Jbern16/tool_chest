Rails.application.routes.draw do
  resources :tools

  resources :users do
    resources :tools, only: [:index]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
