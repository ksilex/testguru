Rails.application.routes.draw do
  root "tests#index"
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :tests, only: %i[index show start] do
    member do
      get :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: %i[index show]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
