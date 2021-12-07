Rails.application.routes.draw do
   scope '/api' do
      get '/events', to: 'events#index'
      post '/events', to: 'events#create'
      get '/events/:id', to: 'events#show'
      put '/events/:id', to: 'events#update'
      delete '/events/:id', to: 'events#destroy'
   end
end
