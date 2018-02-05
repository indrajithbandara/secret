Rails.application.routes.draw do
  
 
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
	get '/profile', to: 'profiles#show', as: 'show_profile'
	get '/answer', to: 'pages#answer'
  root 'pages#index'

end
