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
    
    resources :messages, only: [:index, :create]
  
  end
end
