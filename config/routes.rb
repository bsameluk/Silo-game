Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :games do
    member do
      get 'join', to: 'games#join_form', as: 'join_form'
      post 'join'
      get 'player/:player_id', to: 'games#show_for_player', as: 'player'
    end
    
    resources :players, only: [] do
      member do
        patch 'toggle_attribute'
      end
    end
  end
  
  root 'games#index'
end
