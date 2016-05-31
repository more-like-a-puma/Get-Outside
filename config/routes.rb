Rails.application.routes.draw do
  root "session#new"
  get 'session/new'

  resources :users

  get "/login" => 'session#new', :as => 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => 'logout'

end
