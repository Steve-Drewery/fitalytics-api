Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/api' do
    get '/workouts', to: 'workouts#index'
    post '/workouts', to: 'workouts#create'
    get '/workouts/:id', to: 'workouts#show'
    put '/workouts/:id', to: 'workouts#update'
    delete '/workouts/:id', to: 'workouts#delete'
  end
end
