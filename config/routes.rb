Rails.application.routes.draw do

  root to: "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :finish
    end
  end

  namespace :admin do
    resources :tests, shallow: true do
      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end
end
