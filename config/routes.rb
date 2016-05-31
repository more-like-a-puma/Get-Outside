Rails.application.routes.draw do

  root "users#home"
  get 'session/new'

  resources :users
  resources :destinations

  get "/login" => 'session#new', :as => 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => 'logout'

end
