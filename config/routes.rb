Rails.application.routes.draw do
  # inital page seen
  root 'sessions#home'
  # sign_up 
  get '/signup' => 'users#new'
  post 'signup' => 'users#create'

  # login
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # logout
  delete '/logout' => 'sessions#destroy'


  get '/periods' => 'periods#index'
  get '/periods/new' => 'periods#new'
  post '/periods/new' => 'periods#create'
  get 'period/id/edit' => 'periods#edit'
  patch 'period/id/edit' => 'periods#update'

  # custom routes above line
  resources :users do
    resources :periods, shallow: true
  end
  resources :periods do
    resources :students, shallow: true
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
