Rails.application.routes.draw do

  root "session#new"
  get 'session/new'

  resources :users
  resources :destinations

  get "/login" => 'session#new', :as => 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => 'logout'

end
