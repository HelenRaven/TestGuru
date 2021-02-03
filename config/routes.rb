Rails.application.routes.draw do

  root to: "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :feedbacks, only: %i[new create]

  resources :achievements, only: %i[index]
  resources :badges, only: %i[index]

  resources :results, only: %i[show update] do
    member do
      get :finish
      post :gist
    end
  end

  namespace :admin do
    resources :badges, except: %i[show]
    resources :gists, only: %i[index]
    resources :tests, shallow: true do
      patch :update_inline, on: :member

      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end
end
