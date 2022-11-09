Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
      member do
        post 'room_user'
        post 'propose'
        post 'good'
      end
  
    
    resources :messages, only: [:index, :create, :new] 
  
    
      
    

  
  end
end
