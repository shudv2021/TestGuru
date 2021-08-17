Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout}
             #Переназвал ключи log-in & log_out
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index'
  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
    member do
      post :start
    end
  end
  #Gest test_passages/101/result
  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end

end
