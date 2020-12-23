Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "tests#index"

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: %i[create destroy]

  resources :tests, shallow: true do
    resources :questions, except: :index do
      resources :answers, except: :index
    end

    member do
      post :start
    end
  end

  # GET /results/101/final

  resources :results, only: %i[show update] do
    member do
      get :finish
    end
  end

end
