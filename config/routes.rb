MoocTaManager::Application.routes.draw do
  root :to => 'users#index'

  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#login', :as => 'login'
  get 'logout' => 'sessions#logout', :as => 'logout'
  post 'sessions/authenticate' => 'sessions#authenticate'

  resources :users

  resources :teaching_assistants, :controller => 'users'

  resources :professors, :controller => 'users' do
    resources :courses
  end
  
  resources :ta_tests do
    resources :questions
  end
end
