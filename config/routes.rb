Rails.application.routes.draw do
  resources :assignments
  resources :student_periods
  resources :students
  resources :periods
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
