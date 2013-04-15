MoocTaManager::Application.routes.draw do
  root :to => 'users#index'
  resources :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  resources :courses, :only => [:index]
  resources :users
  resources :professors, :controller => 'users', :shallow => true do
    resources :courses, :shallow => true do
      resources :ta_tests, :shallow => true do
        resources :test_results, :shallow => true
      end
    end
  end
  resources :teaching_assistants, :controller => 'users', :shallow => true
  match "/ta_tests/:ta_test_id/take(.:format)" => "ta_tests#take", :as => :take_ta_test
end
