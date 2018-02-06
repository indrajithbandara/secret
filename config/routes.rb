Rails.application.routes.draw do
  
 
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users', to: 'users#index', as: 'users'
  get '/user/:id/edit', to: 'users#edit', as: 'edit_profile'
  post '/user/:id/edit', to: 'users#update'
  delete '/user/:id', to: 'users#destroy', as: 'delete_profile'


  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
	get '/profile', to: 'profiles#show', as: 'show_profile'
	get '/answer', to: 'pages#answer'
  root 'pages#index'

end
