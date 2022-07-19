Rails.application.routes.draw do
  # inital page seen
  root 'sessions#home'
  # sign_up 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  patch '/signup' => 'users#update'

  #oauth-google login
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  # login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  

  # logout
  delete '/logout' => 'sessions#destroy'

  #high grades
  get '/high_grades' => 'grades#high_grades'

  #post routes
  #post '/periods/new' => 'periods#create'
  post '/periods/:id/edit' => 'periods#update'

  post '/students/new' => 'students#create'
  post '/students/:id/edit' => 'students#update'
  delete '/student/:id' => 'students#destroy'
 
  post '/periods/:id/student_periods/new' => 'student_periods#create'
  post '/student_periods/:id/edit' => 'student_periods#destroy'

  post '/assignments/:id/edit' => 'assignments#update'
  post '/periods/:id/assignments/new' => 'assignments#create'
  delete '/assignments/:id' => 'assignments#destroy'

  post '/assignments/:id/grades/new' => 'grades#create'
  post '/grades/:id/edit' => 'grades#update'
  delete '/grades/:id' => 'grades#destroy'
  # custom routes above line
  resources :users do
    resources :periods
  end
  resources :periods do
    resources :students
    resources :student_periods
    resources :assignments
  end
  resources :students do
    resource :grades
  end
  resources :assignments do
    resources :grades
  end
  resources :grades
  resources :student_periods
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
