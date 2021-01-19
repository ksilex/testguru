Rails.application.routes.draw do
  root "tests#index"
  resources :tests do
    member do
      post :start
    end
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: %i[index show]
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
