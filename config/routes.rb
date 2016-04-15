Rails.application.routes.draw do
  root to: 'gifs#index'

  resources :gifs, only: [:index, :show]
  resources :users, only: [:new, :create] do
    resources :gifs, only: [:index]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
