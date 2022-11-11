Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
      member do
        post 'room_user'
      
        
      end
  
    
    resources :messages, only: [:index, :create, :new] 

  
  resources :proposes, only: [:create, :destroy] do
    member do
      post 'good'
  end
end
    
      
    

  
  end
end
