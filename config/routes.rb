Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'surveys#index'
  
  #user
  get '/users/new' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users' => 'users#index', as: '_users'

  #sessions
  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'
  get '/sessions' => 'sessions#delete'

  #surveys
  resources :surveys
end
