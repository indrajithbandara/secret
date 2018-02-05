Rails.application.routes.draw do
  
  # rename get 'profiles/show'
	get '/profile', to: 'profiles#show', as: 'show_profile'
  #get 'pages/index'
  root 'pages#index'

end
