Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
scope '/api' do
    get '/events', to: 'events#index'
    post '/events', to: 'events#create'
    get '/events/user',to:'events#my_events'
    get '/events/:id', to: 'events#show'
    put '/events/:id', to: 'events#update'
    delete 'events/:id', to: 'events#destroy'
    
    get '/rosters', to: 'rosters#index'
    post '/rosters', to: 'rosters#create'
    get '/rosters/user',to:'rosters#my_rosters'
    get '/rosters/:id', to: 'rosters#show'
    put 'rosters/:id', to: 'rosters#update'
    delete 'rosters/:id', to: 'rosters#destroy'

    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'
    get '/users/:email', to: 'users#show'

    post '/forgot_password', to: 'passwords#forgot'
    post '/reset_password', to: 'passwords#reset'
    

scope '/auth' do 
  post '/sign_up', to: 'users#create'
  post '/sign_in', to: 'users#sign_in'
end
end
end

