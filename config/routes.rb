Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
      get 'category'
      get 'join'
      get 'recomend'
    end
      member do
        post 'room_user'
        delete 'deroom_user'
      
        
      end
  
    
    resources :messages, only: [:index, :create, :new] 

  
  resources :proposes, only: [:create, :destroy] do
    member do
      post 'good'
  end
end
    
      
    

  
  end
end
