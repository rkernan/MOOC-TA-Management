MoocTaManager::Application.routes.draw do
  root :to => 'users#index'
  resources :sessions
  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  resources :courses, :only => [:index]
  resources :users
  resources :professors, :controller => 'users', :shallow => true do
    resources :courses, :shallow => true do
      resources :ta_tests, :shallow => true
    end
  end
end
