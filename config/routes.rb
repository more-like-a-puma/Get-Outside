Rails.application.routes.draw do

  get 'activities/index'

  get 'activities/new'

  get 'activities/show'

  get 'activities/edit'

  get 'activities/_form'

  root "users#home"
  get 'session/new'

  resources :users
  resources :destinations

  get "/login" => 'session#new', :as => 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => 'logout'

end
