Rails.application.routes.draw do
  devise_for :users

  resources :users
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

  resources :pools
  resources :games
  resources :teams
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
