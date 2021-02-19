Rails.application.routes.draw do
  root "tests#index"
  resources :feedbacks, only: %i[new create]
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get "profile", to: "users/sessions#profile"
  end
  resources :tests, only: %i[index show start] do
    member do
      get :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: %i[index show]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
