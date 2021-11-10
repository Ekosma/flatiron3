Rails.application.routes.draw do

  get '/signup' => 'users#new'
  #post 'signup' => 'users#create' (use built in submission instead)
  # custom routes above line
  resources :assignments
  resources :student_periods
  resources :students
  resources :periods
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
