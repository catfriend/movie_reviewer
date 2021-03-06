Rails.application.routes.draw do

  resources :genres

  resource :session

  get 'signin' => 'sessions#new'

  get 'signup' => 'users#new'

  get 'movies/filter/:scope' => 'movies#index', as: :filtered_movies

  resources :users
  
  root "movies#index"
  resources :movies do
  	resources :reviews
  	resources :favorites
  end
end
