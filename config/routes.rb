Rails.application.routes.draw do
  # inital page seen
  root 'sessions#home'
  # sign_up 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  patch '/signup' => 'users#update'

  # login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # logout
  delete '/logout' => 'sessions#destroy'


  get '/periods' => 'periods#index'
  get '/periods/new' => 'periods#new'
  post '/periods/new' => 'periods#create'
  get '/periods/:id/edit' => 'periods#edit'
  post '/periods/:id/edit' => 'periods#update'
  delete '/periods/:id' => 'periods#destroy'

  get '/students' => 'students#index'
  get '/students/new' => 'students#new'
  post '/students/new' => 'students#create'
  get '/students/:id/edit' => 'students#edit'
  post '/students/:id/edit' => 'students#update'
  delete '/students/:id' => 'students#destroy'

  # custom routes above line    
  resources :users do
    resources :periods
  end
  resources :periods do
    resources :students
    resource :assignments
  end
  resources :students do
    resources :periods
    resource :assignments
  end
  resources :assignments
  resources :student_periods
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
