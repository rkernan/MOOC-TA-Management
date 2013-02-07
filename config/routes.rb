MoocTaManager::Application.routes.draw do
  root :to => 'users#index'
  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#login', :as => 'login'
  get 'logout' => 'sessions#logout'

  post 'sessions/authenticate' => 'sessions#authenticate'

  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/new' => 'users#new'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
end
