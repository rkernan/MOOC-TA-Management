MoocTaManager::Application.routes.draw do
  root :to => 'users#index'
  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  resources :users # for all the other random user methods
end
