Rails.application.routes.draw do

  resources :genres

  resources :likes

  resource :session

  get 'signin' => 'sessions#new'

  get 'signup' => 'users#new'

  resources :users
  
  root "movies#index"
  resources :movies do
  	resources :reviews
  	resources :favorites
  end
end
