MoocTaManager::Application.routes.draw do
  root :to => 'users#index'

  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#login', :as => 'login'
  get 'logout' => 'sessions#logout', :as => 'logout'
  post 'sessions/authenticate' => 'sessions#authenticate'

  resources :users

  resources :professors, :controller => 'users' do
    resources :courses do
      resources :ta_tests do
        resources :questions
        resources :test_results
      end
    end
  end

  resources :teaching_assistants, :controller => 'users' do
    resources :test_results
    resources :courses do
      resources :ta_tests do
        resources :questions
      end
    end
  end
end
