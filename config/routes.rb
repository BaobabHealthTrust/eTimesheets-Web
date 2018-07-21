Rails.application.routes.draw do

  get 'home/index'

  ######################## user routes ######################
  get '/login' => 'user#login'
  post '/login' => 'user#login'
  ######################## user routes ends ######################
  
  
  ######################## timesheet routes ######################
  get '/create' => 'timesheet#new'
  ######################## timesheet routes ends ######################
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
