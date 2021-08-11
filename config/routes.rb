Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :create
  get :signup, to: 'users#new'

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
