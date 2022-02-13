Rails.application.routes.draw do
  #get 'games/index'
  #get 'games/show'
  resources :games, only: [:index, :show]
  resources :platforms, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :employees, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
