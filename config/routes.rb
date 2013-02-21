MoocTaManager::Application.routes.draw do
  root :to => 'users#index'
  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#login', :as => 'login'
  get 'logout' => 'sessions#logout', :as => 'logout'

  post 'sessions/authenticate' => 'sessions#authenticate'

  get 'users' => 'users#index'
  post 'users' => 'users#create', :as => 'create_user'
  get 'users/new' => 'users#new', :as => 'new_user'
  get 'users/:id' => 'users#show', :as => 'user'
  get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  get 'ta_tests' => 'ta_tests#index'
  get 'ta_tests/new' => 'ta_tests#new'
  post 'ta_tests' => 'ta_tests#create'
end
