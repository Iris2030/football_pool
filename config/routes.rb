Rails.application.routes.draw do
  devise_for :users
  
  resources :games do
    member do
      get "add_score"
    end
    collection do
      get "show_scoreboard"
    end
  end
  
  resources :pools do
    member do
      get "edit_bet"
    end
  end

  resources :users do
    member do
      get "edit_profile"
    end
  end
  
  resources :teams do
    member do
      get "edit_team"
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  namespace :api do
    namespace :v1 do
      resources :games
    end
  end


  resources :users
  resources :pools
  resources :games
  resources :teams
  root to: 'pages#home'
  
  get 'users/index'

  unauthenticated :user do
    root to: redirect("/users/sign_in"), as: :login
    
    
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
