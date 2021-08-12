Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  post :exit, to: 'sessions#exit'

  resources :users, only: :create
  resources :sessions, only: :create

  root to: 'tests#index'
  resources :tests do
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

end
