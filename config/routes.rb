Rails.application.routes.draw do
  #inital page seen
  root 'sessions#home'
  #sign_up 
  get '/signup' => 'users#new'
  post 'signup' => 'users#create'

  #login
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'
  # custom routes above line
  resources :assignments
  resources :student_periods
  resources :students
  resources :periods do
    resources :students
  end
  resources :users do
    resources :periods
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
