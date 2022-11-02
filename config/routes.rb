Rails.application.routes.draw do
  resources :games do
    member do
      get "add_score"
    end
  end
  
  resources :games do
    collection do
      get "show_scoreboard"
  end
end
    resources :pools
    resources :games
    resources :teams
    root to: 'pages#home'
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    
    # Defines the root path route ("/")
    # root "articles#index"
  end
  