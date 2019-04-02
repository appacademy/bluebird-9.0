Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get request to /users maps to the index action in the users controller
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # get '/custom', to: 'users#cheese' # we can do this too!

  # can do except instead of only 
  resources :users do
    # maybe we have a form to create a chirp on the user show page
    resources :chirps, only: [:create, :index]
  end 


  resources :chirps, only: [:show]

end
