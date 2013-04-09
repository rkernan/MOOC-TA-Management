MoocTaManager::Application.routes.draw do
  root :to => 'users#index'
  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#login', :as => 'login'
  get 'logout' => 'sessions#logout', :as => 'logout'
  post 'sessions/authenticate' => 'sessions#authenticate'
  resources :users
  resources :professors, :controller => 'users', :shallow => true do
    resources :courses, :shallow => true do
      resources :ta_tests, :shallow => true
    end
  end
end
