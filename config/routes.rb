Rails.application.routes.draw do

  # get 'game/index'

  # get 'game/new'

  # get 'game/show'

  # get 'sessions/index'

  # get 'sessions/new'
  root "sessions#index"
  resources :users
  resources :game
  resources :team
  patch "/points/:id" => "team#points"

  post "/login" => "sessions#login"
  delete "/logout" => "sessions#logout"

  post "/team/:id" => "team#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
