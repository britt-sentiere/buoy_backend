Rails.application.routes.draw do
  namespace :api do

    get '/students' => 'students#index'
    post '/students' => 'students#create'
    get '/students/:id' => 'students#show'
    patch '/students/:id' => 'students#update'
    delete '/students/:id' => 'students#destroy'
    post '/sessions' => 'sessions#create'

    get '/teachers' => 'teachers#index'
    post '/teachers' => 'teachers#create'
    get '/teachers/:id' => 'teachers#show'
    patch '/teachers/:id' => 'teachers#update'
    delete '/teachers/:id' => 'teachers#destroy'


    get '/courses' => 'courses#index'
    # post '/courses' => 'courses#create'
    get '/courses/:id' => 'courses#show'
    # patch '/courses/:id' => 'courses#update'
    # delete '/courses/:id' => 'courses#destroy'

    get '/help_requests' => 'help_requests#index'
    # post '/help_requests' => 'help_requests#create'
    get '/help_requests/:id' => 'help_requests#show'
    # patch '/help_requests/:id' => 'help_requests#update'
    # delete '/help_requests/:id' => 'help_requests#destroy'

    get '/participations' => 'participations#index'
    # post '/participations' => 'participations#create'
    get '/participations/:id' => 'participations#show'
    # patch '/participations/:id' => 'participations#update'
    delete '/participations/:id' => 'participations#destroy'

  end 
end