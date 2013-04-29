MoocTaManager::Application.routes.draw do
  get "ta_test_request/index"

  root :to => 'users#index'
  resources :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  resources :courses, :only => [:index]
  resources :users
  resources :professors, :controller => 'users', :shallow => true do
    resources :courses, :shallow => true do
      resources :ta_test_requests
      resources :ta_tests, :shallow => true do
        resources :test_results, :except => [:index], :shallow => true
      end
    end
  end
  resources :teaching_assistants, :controller => 'users', :shallow => true do
    resources :test_results, :only => [:index]
  end
end
