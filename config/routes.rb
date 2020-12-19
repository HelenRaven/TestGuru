Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "tests#index"

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
