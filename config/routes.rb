Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/api' do
    resources :users, param: :username
    get '/workouts', to: 'workouts#index'
    post '/workouts', to: 'workouts#create'
    get '/workouts/:id', to: 'workouts#show'
    put '/workouts/:id', to: 'workouts#update'
    delete '/workouts/:id', to: 'workouts#destroy'
    scope '/auth' do
      post '/login', to: 'authentication#login'
    end
    get '/ladder', to: 'ladder#index'
    get '/ladder/weight', to: 'ladder#weight'
    get '/ladder/swimming', to: 'ladder#swimming'
    get '/ladder/running', to: 'ladder#running'
  end
  
end
