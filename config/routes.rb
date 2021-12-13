Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
scope '/api' do
    get '/events', to: 'events#index'
    post '/events', to: 'events#create'
    get '/events/user',to:'events#my_events'
    get '/events/:id', to: 'events#show'
    put 'events/:id', to: 'events#update'
    delete 'events/:id', to: 'events#destroy'
scope '/auth' do 
  post '/sign_up', to: 'users#create'
  post '/sign_in', to: 'users#sign_in'
end
end
end

